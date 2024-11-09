Return-Path: <linux-kbuild+bounces-4598-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 687AF9C2F8A
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Nov 2024 21:42:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0253A281C1A
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Nov 2024 20:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B647019D087;
	Sat,  9 Nov 2024 20:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fLa7TvZm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C626141987;
	Sat,  9 Nov 2024 20:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731184973; cv=none; b=BJt6Rh7zlKAEq/5fdQJGW1X06mrFbCr2RICRR99XwwQohsP45DWQOiJpeWZDmLP7LCSlAqd8QRtXR3C5mofSPtnIGQHwJBIoyvg1wk5YSC0YYmpWAdvEy7XsCM1o5mxcpGCteCCidvXjCQ6M1AW1CxL1lXXoREsrlnvuoHwIJbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731184973; c=relaxed/simple;
	bh=BFhgPPgad6REJXOdQ2aLdthpgZaIIX1wlW/yV1yhNeM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jsewkz03wXw6FMVo+MmtdQXFFBUU29OBIcapX2nLGVDGdfVs5l33JtbuZaCUzTOjLdjxvTm5rAqu0xlf4g54Z4eO9Z95fYw6Ze9U2eqtGM2R0naPoMZYGPVF3uoCbcoSpk/W1B8U7EmN29dJ8X88wqY8H3HeboNN0G9agHzY6XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fLa7TvZm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0108EC4CECE;
	Sat,  9 Nov 2024 20:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731184973;
	bh=BFhgPPgad6REJXOdQ2aLdthpgZaIIX1wlW/yV1yhNeM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fLa7TvZmg0MGBkP7O9j1l5viOm4+1C/KCCoz4nREYhHA4L3jpI99nlj3jXWatcPNb
	 eR3WXSivGmist8YjYAKnw9yN5WA4a7mHOf8fUa08oCxgePP2VMR/AYRW5yRPt1IHOy
	 cUuCZlhDoDEJI/1vMXeVPS9C5wV8gm8tGVMhnHWB2vU+nQHowtTrVm0lY0MC/RcNg3
	 1Z1qVOY8SUHHO6KAQp3uNUl4i9FIJolgejpn8IlchV0a0AxAm/8D6pinyIXzoFFxwv
	 geLx7hVzm67BgSyrnYrU7HLManvDVP5wO4kw9qGXeFJ/xPr3NabVZZSwqC08P/6tSO
	 udXcB9t4l1+ow==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb4fa17044so32122811fa.3;
        Sat, 09 Nov 2024 12:42:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUoh1yIkdm6TYHXQNSAkEQ3IMYoZh6RwBXeFOyB3yJdtKc7Cduc/+JV7HiRk5hm1sYRIVxHHYKLsDQH1xU=@vger.kernel.org, AJvYcCVeQf/yTMS7g72xFUnQJS+s3QAnjQhYMPeFF3l836TaqrsyyR+7AeT01RTBEfXXWFgaSoDvgAAqJy7tlg6K@vger.kernel.org
X-Gm-Message-State: AOJu0YzT+jqqgLwI3YovK08rNRIjeUUctNJqyILWspKqVQLYB/ChcFcR
	bWgnuUUjpHoWdWcrKqU3TAqS6JX6aKj4fHrXCt44df+5jzzDjUENthuj96c13681BDPq8+ACrK2
	qYU4UX26iz9zDBIv3U3pnDLiPnpA=
X-Google-Smtp-Source: AGHT+IE2S9grDzqoTtysRKHtscKPUIepmw5PxlCowp+EZ6gFKhjPgVj82eyZUl2qAN2kqcy6geg0UanTGVyB0m6dMxE=
X-Received: by 2002:a2e:be9f:0:b0:2fb:6057:e67e with SMTP id
 38308e7fff4ca-2ff2028a877mr33511061fa.32.1731184971659; Sat, 09 Nov 2024
 12:42:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241031132630.24667-1-t.boehler@kunbus.com> <20241031132630.24667-2-t.boehler@kunbus.com>
In-Reply-To: <20241031132630.24667-2-t.boehler@kunbus.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 10 Nov 2024 05:42:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNATe6Ch7T4Vqkiq=b0cyjEGPTTtJiz-m_FuY2mdfO1JYHg@mail.gmail.com>
Message-ID: <CAK7LNATe6Ch7T4Vqkiq=b0cyjEGPTTtJiz-m_FuY2mdfO1JYHg@mail.gmail.com>
Subject: Re: [PATCH 1/3] package: debian: strip headers package
To: =?UTF-8?Q?Thomas_B=C3=B6hler?= <t.boehler@kunbus.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Philipp Rosenberger <p.rosenberger@kunbus.com>, 
	Lino Sanfilippo <l.sanfilippo@kunbus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2024 at 10:26=E2=80=AFPM Thomas B=C3=B6hler <t.boehler@kunb=
us.com> wrote:
>
> The linux-headers package contains unstripped binaries. Lintian
> complains about this:
>
>     E: linux-headers-6.12.0-rc4-g7e04fcfc6195: unstripped-binary-or-objec=
t [usr/src/linux-headers-6.12.0-rc4-g7e04fcfc6195/scripts/asn1_compiler]
>     E: linux-headers-6.12.0-rc4-g7e04fcfc6195: unstripped-binary-or-objec=
t [usr/src/linux-headers-6.12.0-rc4-g7e04fcfc6195/scripts/basic/fixdep]
>     E: linux-headers-6.12.0-rc4-g7e04fcfc6195: unstripped-binary-or-objec=
t [usr/src/linux-headers-6.12.0-rc4-g7e04fcfc6195/scripts/kallsyms]
>     E: linux-headers-6.12.0-rc4-g7e04fcfc6195: unstripped-binary-or-objec=
t [usr/src/linux-headers-6.12.0-rc4-g7e04fcfc6195/scripts/mod/modpost]
>     E: linux-headers-6.12.0-rc4-g7e04fcfc6195: unstripped-binary-or-objec=
t [usr/src/linux-headers-6.12.0-rc4-g7e04fcfc6195/scripts/sorttable]
>
> It's not possible to outright strip every package built with
> "debian/rules" as, for instance, the "binary-image" target shouldn't be
> stripped because it contains debug information that the
> "binary-image-dbg" target will make use of.
>
> Thus conditionally use "dh_strip" on the "binary-headers" target after
> using "dh_builddeb" to strip only the contents of the package lintian
> complains about. Also pass the "--no-automatic-dbgsym" option to make
> sure no headers-dbgsym package is created.
>
> Signed-off-by: Thomas B=C3=B6hler <t.boehler@kunbus.com>
> ---
>  scripts/package/debian/rules | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/scripts/package/debian/rules b/scripts/package/debian/rules
> index ca07243bd5cd..0c75319acae1 100755
> --- a/scripts/package/debian/rules
> +++ b/scripts/package/debian/rules
> @@ -46,6 +46,8 @@ define binary
>         $(Q)dh_testroot $(DH_OPTIONS)
>         $(Q)dh_prep $(DH_OPTIONS)
>         $(Q)+$(MAKE) $(make-opts) run-command KBUILD_RUN_COMMAND=3D'+$$(s=
rctree)/scripts/package/builddeb $(package)'
> +       $(if $(filter $(headers-package),$(package)),\
> +               $(Q)dh_strip $(DH_OPTIONS) --no-automatic-dbgsym)
>         $(Q)dh_installdocs $(DH_OPTIONS)
>         $(Q)dh_installchangelogs $(DH_OPTIONS)
>         $(Q)dh_compress $(DH_OPTIONS)
> --
> 2.39.2
>


Probably, I want to postpone this until I figure out
how to sort out issues.

If this patch is applied to the mainline, the following build error will ha=
ppen
because Kbuild works incrementally.

[How to reproduce]

$ make defconfig all
$ make ARCH=3Darm64 CROSS_COMPILE=3Daarch64-linux-gnu- defconfig bindeb-pkg

aarch64-linux-gnu-strip fails because x86 binaries are remaining.



Rebuilding host programs with aarch64-linux-gnu-gcc...
dpkg-deb: building package
'linux-image-6.12.0-rc6-00041-g2808938103be' in
'../linux-image-6.12.0-rc6-00041-g2808938103be_6.12.0-rc6-00041-g2808938103=
be-4_arm64.deb'.
  INSTALL debian/linux-libc-dev/usr/include
  HOSTCC  debian/linux-headers-6.12.0-rc6-00041-g2808938103be/usr/src/linux=
-headers-6.12.0-rc6-00041-g2808938103be/scripts/kallsyms
  HOSTCC  debian/linux-headers-6.12.0-rc6-00041-g2808938103be/usr/src/linux=
-headers-6.12.0-rc6-00041-g2808938103be/scripts/sorttable
  HOSTCC  debian/linux-headers-6.12.0-rc6-00041-g2808938103be/usr/src/linux=
-headers-6.12.0-rc6-00041-g2808938103be/scripts/asn1_compiler
dpkg-deb: building package 'linux-libc-dev' in
'../linux-libc-dev_6.12.0-rc6-00041-g2808938103be-4_arm64.deb'.
  HOSTCC  debian/linux-headers-6.12.0-rc6-00041-g2808938103be/usr/src/linux=
-headers-6.12.0-rc6-00041-g2808938103be/scripts/mod/modpost.o
  HOSTCC  debian/linux-headers-6.12.0-rc6-00041-g2808938103be/usr/src/linux=
-headers-6.12.0-rc6-00041-g2808938103be/scripts/mod/file2alias.o
  HOSTCC  debian/linux-headers-6.12.0-rc6-00041-g2808938103be/usr/src/linux=
-headers-6.12.0-rc6-00041-g2808938103be/scripts/mod/sumversion.o
  HOSTCC  debian/linux-headers-6.12.0-rc6-00041-g2808938103be/usr/src/linux=
-headers-6.12.0-rc6-00041-g2808938103be/scripts/mod/symsearch.o
  HOSTCC  debian/linux-headers-6.12.0-rc6-00041-g2808938103be/usr/src/linux=
-headers-6.12.0-rc6-00041-g2808938103be/scripts/basic/fixdep
  HOSTLD  debian/linux-headers-6.12.0-rc6-00041-g2808938103be/usr/src/linux=
-headers-6.12.0-rc6-00041-g2808938103be/scripts/mod/modpost
aarch64-linux-gnu-strip: Unable to recognise the format of the input
file `debian/linux-headers-6.12.0-rc6-00041-g2808938103be/usr/src/linux-hea=
ders-6.12.0-rc6-00041-g2808938103be/scripts/selinux/genheaders/genheaders'
dh_strip: error: aarch64-linux-gnu-strip --remove-section=3D.comment
--remove-section=3D.note -o /tmp/Kv0I0EefcE/stripYJQMDW
debian/linux-headers-6.12.0-rc6-00041-g2808938103be/usr/src/linux-headers-6=
.12.0-rc6-00041-g2808938103be/scripts/selinux/genheaders/genheaders
returned exit code 1
dh_strip: error: Aborting due to earlier error
make[4]: *** [debian/rules:63: binary-headers] Error 2
make[4]: *** Waiting for unfinished jobs....
dpkg-deb: building package
'linux-image-6.12.0-rc6-00041-g2808938103be-dbg' in
'../linux-image-6.12.0-rc6-00041-g2808938103be-dbg_6.12.0-rc6-00041-g280893=
8103be-4_arm64.deb'.
dpkg-buildpackage: error: make -f debian/rules binary subprocess
returned exit status 2
make[3]: *** [scripts/Makefile.package:126: bindeb-pkg] Error 2
make[2]: *** [Makefile:1570: bindeb-pkg] Error 2
make[1]: *** [/home/masahiro/workspace/linux-kbuild/Makefile:347:
__build_one_by_one] Error 2
make: *** [Makefile:224: __sub-make] Error 2




--
Best Regards
Masahiro Yamada

