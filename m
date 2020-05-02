Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A3221C26AA
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 May 2020 17:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728252AbgEBPu3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 2 May 2020 11:50:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727897AbgEBPu2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 May 2020 11:50:28 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F29A7C061A0C;
        Sat,  2 May 2020 08:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=BOIKzbIo5BcGV37/w+l4DAYaFX32rdH5QAj89meQ9/o=; b=HTcTUDeECrPk6u9Ky5YXUgWxyy
        B+J+f+ubq+oDEJeWNIJUHZgvqpaTCcf0187J1Av3T+ZsESxOAXVZ2C/SvCr09qIoqE5nXvtamRxMM
        +08+pp6HDn1rlJ/d32KMJxTXXK2D1wefsA+1xqbarYPBnKYneltftlucAeq9FHqTvj/M3YTYyJ3F7
        dz9+ZhWnJ4Nr82AjLHqc1GPwWFz2YxSM98wFfuYb8r3IRWqOJ9MSq2UH80xk6UIcQd+Gu6U62vDds
        Yi/kiuSBpaRaZMYB2ELuvt0NL6B0pIXTcZJnFoSSCPqDjxlVoOhDZEzCMmcPwx4FdjhZmSvTsCWvT
        XyJuEpCg==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jUuPH-0007FI-Rh; Sat, 02 May 2020 15:50:23 +0000
Subject: Re: [PATCH v3] streamline_config.pl: add LMC_KEEP to preserve some
 kconfigs
To:     Changbin Du <changbin.du@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20200502153052.5461-1-changbin.du@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6a0c13c6-148d-74b3-4ddc-7252b8b112bf@infradead.org>
Date:   Sat, 2 May 2020 08:50:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200502153052.5461-1-changbin.du@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 5/2/20 8:30 AM, Changbin Du wrote:
> Sometimes it is useful to preserve batches of configs when making
> localmodconfig. For example, I usually don't want any usb and fs
> modules to be disabled. Now we can do it by:
> 
>  $ make LMC_KEEP="drivers/usb;fs" localmodconfig
> 
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> 
> ---
> v3: rename LOCALMODCONFIG_PRESERVE to shorter LMC_KEEP.
> v2: fix typo in documentation. (Randy Dunlap)
> ---
>  Documentation/admin-guide/README.rst |  8 +++++++-
>  scripts/kconfig/Makefile             |  1 +
>  scripts/kconfig/streamline_config.pl | 23 +++++++++++++++++++++++
>  3 files changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
> index cc6151fc0845..f7b02ce61ea7 100644
> --- a/Documentation/admin-guide/README.rst
> +++ b/Documentation/admin-guide/README.rst
> @@ -209,10 +209,16 @@ Configuring the kernel
>                             store the lsmod of that machine into a file
>                             and pass it in as a LSMOD parameter.
>  
> +                           Also, you can preserve modules in certain folders
> +                           or kconfig files by spcifying their paths in

                                                  specifying

More below.


> +                           parameter LMC_KEEP.
> +
>                     target$ lsmod > /tmp/mylsmod
>                     target$ scp /tmp/mylsmod host:/tmp
>  
> -                   host$ make LSMOD=/tmp/mylsmod localmodconfig
> +                   host$ make LSMOD=/tmp/mylsmod \
> +                           LMC_KEEP="drivers/usb;drivers/gpu;fs" \
> +                           localmodconfig
>  
>                             The above also works when cross compiling.
>  
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index c9d0a4a8efb3..e0abbf5805f5 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -123,6 +123,7 @@ help:
>  	@echo  '  gconfig	  - Update current config utilising a GTK+ based front-end'
>  	@echo  '  oldconfig	  - Update current config utilising a provided .config as base'
>  	@echo  '  localmodconfig  - Update current config disabling modules not loaded'
> +	@echo  '                    except those preserved by LMC_KEEP environment variable'
>  	@echo  '  localyesconfig  - Update current config converting local mods to core'
>  	@echo  '  defconfig	  - New config with default from ARCH supplied defconfig'
>  	@echo  '  savedefconfig   - Save current config as ./defconfig (minimal config)'
> diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
> index e2f8504f5a2d..f3a2ceed1e82 100755
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

s/presevered/preserved/g  (g means globally, throughout this script)

> +@presevered_kconfigs = split(/;/,$ENV{LMC_KEEP}) if (defined($ENV{LMC_KEEP}));
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

thanks.
-- 
~Randy

