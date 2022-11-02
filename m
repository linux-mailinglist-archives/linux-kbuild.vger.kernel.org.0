Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48220615CA4
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Nov 2022 08:05:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbiKBHFc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Nov 2022 03:05:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbiKBHFb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Nov 2022 03:05:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0213713D03
        for <linux-kbuild@vger.kernel.org>; Wed,  2 Nov 2022 00:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667372671;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=I/TQR2krq2hI7mqrGIodPZiDZMOmKhzS6eWOT8rnNY8=;
        b=Sa1gHEiedra96RX8c8bGiPKeH9RV1EtaaPljRuSa2k/wM3pNKLPBG9gshc24USbb/txPl1
        CwT3Squ+W5nUR/kcBx7D3kmzccqaTP/LXgL5OIaLeadoehiU+0mZwBitYy3dROWfOfSwlk
        fu8JSF6g7mHi2a3i5fbGvE8F210+ZK8=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-411-ifXB-noxN4WNpxvbADjXXg-1; Wed, 02 Nov 2022 03:04:30 -0400
X-MC-Unique: ifXB-noxN4WNpxvbADjXXg-1
Received: by mail-pj1-f70.google.com with SMTP id mj8-20020a17090b368800b002137a506927so6603923pjb.1
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Nov 2022 00:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/TQR2krq2hI7mqrGIodPZiDZMOmKhzS6eWOT8rnNY8=;
        b=A9jA5XNwl1Q2yuheY4zReOXMvpWIB0yXb1oHfx4DhEFn/h9Cvq0ZWjWFj+bDEmWveE
         Z2YQTWvqnPqDR0AQ+rHP949DJUAceCSVzg30pO9elhOpn0PeR0fufEs3AFF2qNiz320Q
         DEnXu0tVRnqGvc/Hhdv0VZ9EV9bpiiDYHkkgx9ng5tmV5uZYwVhOuBrC6F3ib6hwGVjr
         m+J80VVM3xczq8VIgbaGLv5IRRYEL41VxERrKJs3TmZetf0ZiWn0OVohOyovkkF6pcMq
         RmVhVvktDtVDv4RwlMpDTisAPxQ2rvwi1Z+YswXmRGKznDZ6YM/2fMjbCDEbZbIbCRNA
         r0YA==
X-Gm-Message-State: ACrzQf2zTKoEMwwOYYgw89aTVy0dEakX3jNChAOGa5FjFPXEzBa8aU4t
        reV30/TDY6DyKSAjCVPh8zDLHlxcZjNrFv0qMGPvHNg/J0UslUgMQXqJHlRtJBl3HP3aj+zlIH1
        0UmZrH7ik3iLcpudn6hn01XOAxmmymoZLQST2Ft+Z
X-Received: by 2002:a63:5853:0:b0:46f:fdfc:a651 with SMTP id i19-20020a635853000000b0046ffdfca651mr3916567pgm.385.1667372669902;
        Wed, 02 Nov 2022 00:04:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5pRa8jWlzFQTwcYQaQd/gQgUl+wBqlB+a7IDhPYhPNbH+iwQ6JHevUxI8gk7pGiK+qSbU26yFtJsKI9btL0jw=
X-Received: by 2002:a63:5853:0:b0:46f:fdfc:a651 with SMTP id
 i19-20020a635853000000b0046ffdfca651mr3916545pgm.385.1667372669608; Wed, 02
 Nov 2022 00:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <5b59fdb7db34f5292b1d138939c6b70b2b2039dd.1666703850.git.jtoppins@redhat.com>
In-Reply-To: <5b59fdb7db34f5292b1d138939c6b70b2b2039dd.1666703850.git.jtoppins@redhat.com>
From:   =?UTF-8?B?w43DsWlnbyBIdWd1ZXQ=?= <ihuguet@redhat.com>
Date:   Wed, 2 Nov 2022 08:04:18 +0100
Message-ID: <CACT4oufdDqABBG3BekwaPxFpoNbc3H2QMGWkYFgsdsZKmEbaYQ@mail.gmail.com>
Subject: Re: [PATCH next] kbuild: add ability to make source rpm buildable
 using koji
To:     Jonathan Toppins <jtoppins@redhat.com>
Cc:     linux-kbuild@vger.kernel.org, dzickus@redhat.com, kheib@redhat.com,
        jtornosm@redhat.com, Ivan Vecera <ivecera@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Oct 25, 2022 at 3:17 PM Jonathan Toppins <jtoppins@redhat.com> wrot=
e:
>
> From: Ivan Vecera <ivecera@redhat.com>
>
> Changes:
> - added new target 'srcrpm-pkg' to generate source rpm
> - added required build tools to spec file
> - removed locally compiled host tools to force their re-compile
>
> Signed-off-by: Ivan Vecera <ivecera@redhat.com>
> Signed-off-by: Jonathan Toppins <jtoppins@redhat.com>

Acked-by: =C3=8D=C3=B1igo Huguet <ihuguet@redhat.com>

> ---
>  scripts/Makefile.package | 10 ++++++++++
>  scripts/package/mkspec   |  7 +++++++
>  2 files changed, 17 insertions(+)
>
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index 8bbcced67c22..e0830a870394 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -62,6 +62,16 @@ rpm-pkg:
>         +rpmbuild $(RPMOPTS) --target $(UTS_MACHINE)-linux -ta $(KERNELPA=
TH).tar.gz \
>         --define=3D'_smp_mflags %{nil}'
>
> +# srcrpm-pkg
> +# ----------------------------------------------------------------------=
-----
> +PHONY +=3D srcrpm-pkg
> +srcrpm-pkg:
> +       $(MAKE) clean
> +       $(CONFIG_SHELL) $(MKSPEC) >$(objtree)/kernel.spec
> +       $(call cmd,src_tar,$(KERNELPATH),kernel.spec)
> +       +rpmbuild $(RPMOPTS) --target $(UTS_MACHINE) -ts $(KERNELPATH).ta=
r.gz \
> +       --define=3D'_smp_mflags %{nil}' --define=3D'_srcrpmdir $(srctree)=
'
> +
>  # binrpm-pkg
>  # ----------------------------------------------------------------------=
-----
>  PHONY +=3D binrpm-pkg
> diff --git a/scripts/package/mkspec b/scripts/package/mkspec
> index 70392fd2fd29..dda00a948a01 100755
> --- a/scripts/package/mkspec
> +++ b/scripts/package/mkspec
> @@ -33,6 +33,8 @@ EXCLUDES=3D"$RCS_TAR_IGNORE --exclude=3D*vmlinux* --exc=
lude=3D*.mod \
>  --exclude=3D*.o --exclude=3D*.ko --exclude=3D*.cmd --exclude=3DDocumenta=
tion \
>  --exclude=3D.config.old --exclude=3D.missing-syscalls.d --exclude=3D*.s"
>
> +test -n "$LOCALVERSION" && MAKE=3D"$MAKE LOCALVERSION=3D$LOCALVERSION"
> +
>  # We can label the here-doc lines for conditional output to the spec fil=
e
>  #
>  # Labels:
> @@ -49,6 +51,9 @@ sed -e '/^DEL/d' -e 's/^\t*//' <<EOF
>         URL: https://www.kernel.org
>  $S     Source: kernel-$__KERNELRELEASE.tar.gz
>         Provides: $PROVIDES
> +$S     BuildRequires: bc binutils bison dwarves elfutils-libelf-devel fl=
ex
> +$S     BuildRequires: gcc make openssl openssl-devel perl python3 rsync
> +
>         # $UTS_MACHINE as a fallback of _arch in case
>         # /usr/lib/rpm/platform/*/macros was not included.
>         %define _arch %{?_arch:$UTS_MACHINE}
> @@ -80,6 +85,8 @@ $S$M  against the $__KERNELRELEASE kernel package.
>  $S$M
>  $S     %prep
>  $S     %setup -q
> +$S     rm -f scripts/basic/fixdep scripts/kconfig/conf
> +$S     rm -f tools/objtool/{fixdep,objtool}
>  $S
>  $S     %build
>  $S     $MAKE %{?_smp_mflags} KBUILD_BUILD_VERSION=3D%{release}
> --
> 2.31.1
>


--=20
=C3=8D=C3=B1igo Huguet

