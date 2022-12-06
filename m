Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 454F5643CBA
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Dec 2022 06:38:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233006AbiLFFi2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Dec 2022 00:38:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232543AbiLFFi1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Dec 2022 00:38:27 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C396D24089
        for <linux-kbuild@vger.kernel.org>; Mon,  5 Dec 2022 21:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670305045;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iCpQoYaQ/Ha08fQwDldZIJmIopiT9lmDYnqu+ZkZwm8=;
        b=bseQoy3H3wdTKOkdrTTOuTkyP6/DcqvI6D1uf0VTs4bhcFJScieTKZSS3b5rgOdWsbZmUK
        VBy24Uuw18448bYSVTfQN3KYXY8MjvPigVWljmRiKXughnk5xTbxPJIAG2/O2EAhX6GmZl
        e5V95J5CxPu0JtBGY1+CjBRitkymscs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-225-S7p-SYO3M86eHpJrLLUjFg-1; Tue, 06 Dec 2022 00:37:24 -0500
X-MC-Unique: S7p-SYO3M86eHpJrLLUjFg-1
Received: by mail-qv1-f70.google.com with SMTP id ob12-20020a0562142f8c00b004c6c72bf1d0so31328518qvb.9
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Dec 2022 21:37:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iCpQoYaQ/Ha08fQwDldZIJmIopiT9lmDYnqu+ZkZwm8=;
        b=TJzaaQy+5M/YWFxPwXiCfnuL1dsOKJbOTreN0XQTKsgVxxcbSoSLjF7KLNmnBGq4MB
         uJwGBfPw7H7VhJUUcWo5bEm0U/+ZBpD0q/QrcaEKynljDrAt3Z/v1Ukf5cC1Mn1ADUaz
         VcWEgl7E5JoZRvzK+IW07rtKbllTkadZlunvO43+nKmd1gngMayNZ/W6o6Fvpyt2ivr3
         YtC98vYyrdJ/3dxUp5U6x4/GVcpsZdZE7RidXP3ff/AM7MRO3QfQBAkVqowVW+QsjVxL
         aMDZEqH2qHKDkzXlAB7E0XYmfTMP7Xa8Q9d4da1tt5Fn8qDmYn7gscALyBy37YT2ERIx
         BwVA==
X-Gm-Message-State: ANoB5pnFCTnLiNDn9pjOvaZNyejhEHuDujgnD5he3gGzK/FW01qaICXG
        6zVUMpKqueSmkSGn+eqOi+TAjFK9Up8HpQljTgtxlYjELx/H7br7inO7COXoYRGtKUX1kZIu3/w
        rK2FXxv6zsZwN/DNnINO32vuv1OyYiy+GkP9o2SpesuaGkhZSL5Gh4JnCf0aiQ1fGKATuRuorg4
        u9
X-Received: by 2002:a05:620a:2728:b0:6fa:1d3b:fa74 with SMTP id b40-20020a05620a272800b006fa1d3bfa74mr75522882qkp.123.1670305043045;
        Mon, 05 Dec 2022 21:37:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5aD1MhwUe0pMh0RGdRRsCbd8zoLd0vIAkPSgLCTOFX8XeHvRDflB9csTbfjT7H0DY5n9Fsqw==
X-Received: by 2002:a05:620a:2728:b0:6fa:1d3b:fa74 with SMTP id b40-20020a05620a272800b006fa1d3bfa74mr75522869qkp.123.1670305042768;
        Mon, 05 Dec 2022 21:37:22 -0800 (PST)
Received: from [192.168.98.18] ([107.12.98.143])
        by smtp.gmail.com with ESMTPSA id o13-20020ac85a4d000000b003a68fe872a5sm2057132qta.96.2022.12.05.21.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 21:37:22 -0800 (PST)
Message-ID: <88901065-469f-0988-f56b-c84d1fabbe8a@redhat.com>
Date:   Tue, 6 Dec 2022 00:37:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH next v2] kbuild: add ability to make source rpm buildable
 using koji
Content-Language: en-US
To:     linux-kbuild@vger.kernel.org
Cc:     masahiroy@kernel.org, dzickus@redhat.com, ihuguet@redhat.com,
        ivecera@redhat.com, jtornosm@redhat.com, kheib@redhat.com,
        linux-kernel@vger.kernel.org, michal.lkml@markovi.net,
        ndesaulniers@google.com, Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>
References: <d6d5ce3169da8559cd20d20889849546cc69be50.1669042125.git.jtoppins@redhat.com>
From:   Jonathan Toppins <jtoppins@redhat.com>
In-Reply-To: <d6d5ce3169da8559cd20d20889849546cc69be50.1669042125.git.jtoppins@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 11/21/22 09:48, Jonathan Toppins wrote:
> From: Ivan Vecera <ivecera@redhat.com>
> 
> Changes:
> - added new target 'srcrpm-pkg' to generate source rpm
> - added required build tools to spec file
> - removed locally compiled host tools to force their re-compile
> 
> Signed-off-by: Ivan Vecera <ivecera@redhat.com>
> Signed-off-by: Jonathan Toppins <jtoppins@redhat.com>
> Acked-by: Íñigo Huguet <ihuguet@redhat.com>
> Tested-by: Ivan Vecera <ivecera@redhat.com>
> ---
> 
> Notes:
>      v2:
>       * updated UTS_MACHINE to be $(UTS_MACHINE)-linux
>         suggested by Masahiro Yamada

Quick ping, wanted to make sure I didn't miss any requests. Looking at 
patchwork there appear to be no replies to this version. Would it be 
reasonable to assume this version will be accepted and make it into the 
next kernel?

> 
>   scripts/Makefile.package | 10 ++++++++++
>   scripts/package/mkspec   |  7 +++++++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index 8bbcced67c22..1290f1c631fb 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -62,6 +62,16 @@ rpm-pkg:
>   	+rpmbuild $(RPMOPTS) --target $(UTS_MACHINE)-linux -ta $(KERNELPATH).tar.gz \
>   	--define='_smp_mflags %{nil}'
>   
> +# srcrpm-pkg
> +# ---------------------------------------------------------------------------
> +PHONY += srcrpm-pkg
> +srcrpm-pkg:
> +	$(MAKE) clean
> +	$(CONFIG_SHELL) $(MKSPEC) >$(objtree)/kernel.spec
> +	$(call cmd,src_tar,$(KERNELPATH),kernel.spec)
> +	+rpmbuild $(RPMOPTS) --target $(UTS_MACHINE)-linux -ts $(KERNELPATH).tar.gz \
> +	--define='_smp_mflags %{nil}' --define='_srcrpmdir $(srctree)'
> +
>   # binrpm-pkg
>   # ---------------------------------------------------------------------------
>   PHONY += binrpm-pkg
> diff --git a/scripts/package/mkspec b/scripts/package/mkspec
> index 70392fd2fd29..dda00a948a01 100755
> --- a/scripts/package/mkspec
> +++ b/scripts/package/mkspec
> @@ -33,6 +33,8 @@ EXCLUDES="$RCS_TAR_IGNORE --exclude=*vmlinux* --exclude=*.mod \
>   --exclude=*.o --exclude=*.ko --exclude=*.cmd --exclude=Documentation \
>   --exclude=.config.old --exclude=.missing-syscalls.d --exclude=*.s"
>   
> +test -n "$LOCALVERSION" && MAKE="$MAKE LOCALVERSION=$LOCALVERSION"
> +
>   # We can label the here-doc lines for conditional output to the spec file
>   #
>   # Labels:
> @@ -49,6 +51,9 @@ sed -e '/^DEL/d' -e 's/^\t*//' <<EOF
>   	URL: https://www.kernel.org
>   $S	Source: kernel-$__KERNELRELEASE.tar.gz
>   	Provides: $PROVIDES
> +$S	BuildRequires: bc binutils bison dwarves elfutils-libelf-devel flex
> +$S	BuildRequires: gcc make openssl openssl-devel perl python3 rsync
> +
>   	# $UTS_MACHINE as a fallback of _arch in case
>   	# /usr/lib/rpm/platform/*/macros was not included.
>   	%define _arch %{?_arch:$UTS_MACHINE}
> @@ -80,6 +85,8 @@ $S$M	against the $__KERNELRELEASE kernel package.
>   $S$M
>   $S	%prep
>   $S	%setup -q
> +$S	rm -f scripts/basic/fixdep scripts/kconfig/conf
> +$S	rm -f tools/objtool/{fixdep,objtool}
>   $S
>   $S	%build
>   $S	$MAKE %{?_smp_mflags} KBUILD_BUILD_VERSION=%{release}

