Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F16001C1B1D
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 May 2020 19:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729007AbgEARHc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 May 2020 13:07:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:50890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728925AbgEARHb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 May 2020 13:07:31 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AB90120836;
        Fri,  1 May 2020 17:07:30 +0000 (UTC)
Date:   Fri, 1 May 2020 13:07:29 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Changbin Du <changbin.du@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] streamline_config.pl: add LOCALMODCONFIG_PRESERVE to
 preserve some kconfigs
Message-ID: <20200501130729.3a3e4994@gandalf.local.home>
In-Reply-To: <20200501023708.108830-1-changbin.du@gmail.com>
References: <20200501023708.108830-1-changbin.du@gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri,  1 May 2020 10:37:08 +0800
Changbin Du <changbin.du@gmail.com> wrote:

> Sometimes it is useful to preserve batches of configs when making
> localmodconfig. For example, I usually don't want any usb and fs
> modules to be disabled. Now we can do it by:
> 
>  $ make LOCALMODCONFIG_PRESERVE="drivers/usb;fs" localmodconfig

That's too much typing ;-) What about just "KEEP='drivers/usb;fs'"?


> 
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> ---
>  Documentation/admin-guide/README.rst |  8 +++++++-
>  scripts/kconfig/streamline_config.pl | 23 +++++++++++++++++++++++
>  2 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
> index cc6151fc0845..6deff95362f8 100644
> --- a/Documentation/admin-guide/README.rst
> +++ b/Documentation/admin-guide/README.rst
> @@ -209,10 +209,16 @@ Configuring the kernel
>                             store the lsmod of that machine into a file
>                             and pass it in as a LSMOD parameter.
>  
> +                           Also, you can preserve modules in certen folders
> +                           or kconfig files by spcifying there paths in
> +                           parameter LOCALMODCONFIG_PRESERVE.
> +
>                     target$ lsmod > /tmp/mylsmod
>                     target$ scp /tmp/mylsmod host:/tmp
>  
> -                   host$ make LSMOD=/tmp/mylsmod localmodconfig
> +                   host$ make LSMOD=/tmp/mylsmod \
> +                           LOCALMODCONFIG_PRESERVE="drivers/usb;drivers/gpu;fs" \
> +                           localmodconfig
>  
>                             The above also works when cross compiling.
>  
> diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
> index e2f8504f5a2d..ab5d1e10a5d0 100755
> --- a/scripts/kconfig/streamline_config.pl
> +++ b/scripts/kconfig/streamline_config.pl
> @@ -143,6 +143,7 @@ my %depends;
>  my %selects;
>  my %prompts;
>  my %objects;
> +my %config2kfile;
>  my $var;
>  my $iflevel = 0;
>  my @ifdeps;
> @@ -201,6 +202,7 @@ sub read_kconfig {
>  	if (/^\s*(menu)?config\s+(\S+)\s*$/) {
>  	    $state = "NEW";
>  	    $config = $2;
> +	    $config2kfile{"CONFIG_$config"} = $kconfig;
>  
>  	    # Add depends for 'if' nesting
>  	    for (my $i = 0; $i < $iflevel; $i++) {
> @@ -592,6 +594,22 @@ while ($repeat) {
>  
>  my %setconfigs;
>  
> +my @presevered_kconfigs;
> +@presevered_kconfigs = split(/;/,$ENV{LOCALMODCONFIG_PRESERVE}) if (defined($ENV{LOCALMODCONFIG_PRESERVE}));
> +
> +sub in_presevered_kconfigs {
> +    my $kconfig = $config2kfile{$_[0]};
> +    if (!defined($kconfig)) {
> +        return 0;
> +    }
> +    foreach my $excl (@presevered_kconfigs) {
> +        if($kconfig =~ /^$excl/) {
> +            return 1;
> +        }
> +    }
> +    return 0;
> +}
> +
>  # Finally, read the .config file and turn off any module enabled that
>  # we could not find a reason to keep enabled.
>  foreach my $line (@config_file) {
> @@ -644,6 +662,11 @@ foreach my $line (@config_file) {
>      }
>  
>      if (/^(CONFIG.*)=(m|y)/) {
> +        if (in_presevered_kconfigs($1)) {
> +            dprint "Preserve config $1";
> +            print;
> +            next;
> +        }
>  	if (defined($configs{$1})) {
>  	    if ($localyesconfig) {
>  	        $setconfigs{$1} = 'y';

I'll have to test it out, but I like the idea!

-- Steve
