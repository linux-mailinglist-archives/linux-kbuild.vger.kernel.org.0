Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4748B1C1AD8
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 May 2020 18:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729108AbgEAQv0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 May 2020 12:51:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729037AbgEAQv0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 May 2020 12:51:26 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30E45C061A0C;
        Fri,  1 May 2020 09:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=n9haxtTdPsM3vis4cWiRkPW5G3zM3/2eGW7TPtvZcg0=; b=p87mHAf/eQIlGRTsID1xTYHySL
        J/rH6ksVY6LA5439Bej9XhV0gjyBcM5Dy1mOK/YsWR3TnpcrRtcIVEdj1IQs7UvD/cteEll0QPEYU
        0M9x0qdYj2pksoPOoyS931xv+Fg0z1n10akc39gnNyLO2lqKVLrNRuVU9DMZujTYSNYlolFaPnJAM
        6gj8/rADpagmQ0wTj3Wy3yQ6lf+G/9CcgxOvoEOKBny4E4p/293UyvisK4C7tYItpctAiEmP28+Wz
        JgcssccVpeDPcNQ7Z7TV5FkW87ABLjT7Z9wvh8YCKv2fGKYXUUXIah8DQBxc1r02zuVLuQCXmuTpo
        fWrEaLhA==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jUYsg-0007Ss-CO; Fri, 01 May 2020 16:51:18 +0000
Subject: Re: [PATCH] streamline_config.pl: add LOCALMODCONFIG_PRESERVE to
 preserve some kconfigs
To:     Changbin Du <changbin.du@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20200501023708.108830-1-changbin.du@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <07f3fe15-ae8d-c11a-c29f-ed9c51c2addc@infradead.org>
Date:   Fri, 1 May 2020 09:51:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200501023708.108830-1-changbin.du@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 4/30/20 7:37 PM, Changbin Du wrote:
> Sometimes it is useful to preserve batches of configs when making
> localmodconfig. For example, I usually don't want any usb and fs
> modules to be disabled. Now we can do it by:
> 
>  $ make LOCALMODCONFIG_PRESERVE="drivers/usb;fs" localmodconfig
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

typo:                                                           certain

> +                           or kconfig files by spcifying there paths in

again:                                            specifying their

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
> 


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
