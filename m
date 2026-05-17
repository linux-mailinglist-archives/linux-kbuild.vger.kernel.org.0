Return-Path: <linux-kbuild+bounces-13188-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 76lQLdhbCWprWgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13188-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 08:10:32 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE41A55F681
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 08:10:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBF5D3007AC1
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 06:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96F66311C01;
	Sun, 17 May 2026 06:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWhBZM+J"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399844502F
	for <linux-kbuild@vger.kernel.org>; Sun, 17 May 2026 06:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778998228; cv=none; b=XH+2detxt7kQtLQypzM4IzmjwRC3dOLDmFnFfPtHxd207pWNOLdsfPXGGLx3gA7pmtY2avOpYy5p1XU2UCNVq6bCgMdpfBTb55efA2h2CnF0y8fWoQtOwzOnPa4mLaD4MsnU6aZPVW1owUMicLHP8bcx66V9fd2aQ6/uCVQCp0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778998228; c=relaxed/simple;
	bh=oLbxiEOS9lWW8LguotG7rV1PIyHElDchiSCdjQrlG0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tjb4p5mwGoAWlLyiTjLXnZlSgTKDVpXnf3qe4QvaAJV0VBkyC6kLzzRH5SYByDsHLOgBYKcZOFLbGcR3vpIsDUH1f89tglkFfjbO25vuqcvd7WZyGCy8HDDaq42kykqr8VQQ+FNgeeJgGeGSw8wdLMUFRxLVUhRb8TCKQ0ofN8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWhBZM+J; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7bdc947aaa3so5603097b3.0
        for <linux-kbuild@vger.kernel.org>; Sat, 16 May 2026 23:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778998223; x=1779603023; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YIjfgd4L6MUds2kMM6OSrnv2L/RP7BIlEm4DaN3No0k=;
        b=JWhBZM+Jj/QOsl2/rh/P3pwV3C81gdlGz7I5HSOCcwTjhAl+1nHpOAcJDRP97nCedD
         GQOd5jkJ6VqfL8wPWWACaGmButmpYEjf9SlvMrXrzOjO9I3DE6TFe/CCd/AdA+zOPyXq
         qlrRPrMGm9fPlx0uJZVxr5IcltrTRBUWBsusSoGqVQvXe+rRxNTt4UEAeJvmoOUyyK6a
         hA1X3hJRSAXXL40AMpasQPc08ONcRr2nmK15FeKtYT3YfusrBqNtHEaNZDi/nMUvgJ20
         8vYx0mwiYPDHiMhxMfL9JvbnUdwLzM7HwdLE/mn2KFfYCq/qTRT4cJYETfymzhmcKiYG
         i8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778998223; x=1779603023;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YIjfgd4L6MUds2kMM6OSrnv2L/RP7BIlEm4DaN3No0k=;
        b=PvzbN4UZfdxdQw/1nOfcHYEyXR/nh12YddhMLOnOPZgnknvprfDBXT+MBgqPq/NqQ6
         mRv6+8eczh0A/PF7UtN46zfJBslOLl51mgibTYniy8g/mlDFgIB6THxgFoJljSWAIqX+
         NNIKjTwMQ797727AKxUEwmg2J6BHFKu14X7TG8x2/3COrez1qTkLkA9uelO0OVLZP0wl
         P5lOgvzJF1xGutApzyAGY61EaYWY1nKrhLA6fbzosSiShv0sVEg92Jm/ejo0HkdFj23s
         bqJ/K4I2FNovCTR2XeL7f6RnL0LtEhT6CG+4NKktzvXASPjYk/FVV04K4Ll95GugLW/U
         d/nw==
X-Forwarded-Encrypted: i=1; AFNElJ8MIxa6OA+ZpwuOM+SQ+fw4RewnVQjt1JLI77S7veagvzh73Q5eOwDI3OCDykzYMgajKhM7FuDr5dJVbEU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yybj9Jm3Iq/B75lrzpMmS/3nEHsoeB1Yr8vuWhHSOqfybRcRM4u
	WszQqfKUmgTU+uO51iWFmIPQsAv8VbBbT2mUhN8xCxqyPom6HO+XsoDt
X-Gm-Gg: Acq92OGQwscoOtUMqWbrDQFPDXB6CLF4SDnLn5C7FqWMlXE3poWWkxJpvDOmovYiwUI
	GVAPU9tV+V35V7WKlk9qoeGzumj3hSnL6ezVfy7BFTO9BnjiPvkDf36CQzLp2K3FTn7+pu0sXUQ
	eOTCbCSfgDthCrUeh+ZQ6OL/lTFB7ZD3T7OWgrEAyvuWizylBfAUF2XS1LtgBpLI9Ojp+R5UMcx
	6DT/Yb5Aae7eJ3hH5xsSL/LKcUQC3drsw+MpqXGcdh/TcJRwYswuHw/5ez/y0f1PZk23BW3W2KY
	X3jTSsjDcI8TsdtMk8DUxdjR1UDm97yolzcuyxKrRpC1WpCvxIwf8z3xx63nDKx6GONRDK6kHCx
	lPT94T5JJSIUMj62khb27fJZJKEB6ww7HAIs4CvX/PWYSxvZ4Ng/Gxfntc8QRAUsiYgw38SLjic
	AMLJKbZqcFbBkQ3tlqwVUBesqJWKUwuabMLCCwO81lKFsjsJEkZMmVCoPlxmnz0Y3STBkkAep7c
	xY2u03/TYaVrzicEeqXB7GO++OQLyRtRUTBsOBFXg==
X-Received: by 2002:a05:690c:6c87:b0:7c0:8028:11f7 with SMTP id 00721157ae682-7c959b9720amr117545317b3.6.1778998222832;
        Sat, 16 May 2026 23:10:22 -0700 (PDT)
Received: from [10.138.34.110] (h69-131-150-190.cncrtn.broadband.dynamic.tds.net. [69.131.150.190])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc9cbb0404sm4771417b3.42.2026.05.16.23.10.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 23:10:20 -0700 (PDT)
Message-ID: <ba7ec52f-c4e9-4588-9484-dc8280d55593@gmail.com>
Date: Sun, 17 May 2026 02:10:04 -0400
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/3] scripts: add kconfirm
To: Julian Braha <julianbraha@gmail.com>, nathan@kernel.org, nsc@kernel.org
Cc: jani.nikula@linux.intel.com, akpm@linux-foundation.org, gary@garyguo.net,
 ljs@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 masahiroy@kernel.org, ojeda@kernel.org, corbet@lwn.net,
 qingfang.deng@linux.dev, yann.prono@telecomnancy.net, ej@inai.de,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260516215354.449807-1-julianbraha@gmail.com>
 <20260516215354.449807-2-julianbraha@gmail.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20260516215354.449807-2-julianbraha@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XrfVtVa1LPouWVhsakWdKgBS"
X-Rspamd-Queue-Id: AE41A55F681
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13188-lists,linux-kbuild=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	HAS_ATTACHMENT(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[demiobenour@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------XrfVtVa1LPouWVhsakWdKgBS
Content-Type: multipart/mixed; boundary="------------TqV93QP1ulPRmspZYpcTeGjR";
 protected-headers="v1"
Message-ID: <ba7ec52f-c4e9-4588-9484-dc8280d55593@gmail.com>
Date: Sun, 17 May 2026 02:10:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/3] scripts: add kconfirm
To: Julian Braha <julianbraha@gmail.com>, nathan@kernel.org, nsc@kernel.org
Cc: jani.nikula@linux.intel.com, akpm@linux-foundation.org, gary@garyguo.net,
 ljs@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 masahiroy@kernel.org, ojeda@kernel.org, corbet@lwn.net,
 qingfang.deng@linux.dev, yann.prono@telecomnancy.net, ej@inai.de,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260516215354.449807-1-julianbraha@gmail.com>
 <20260516215354.449807-2-julianbraha@gmail.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20260516215354.449807-2-julianbraha@gmail.com>

--------------TqV93QP1ulPRmspZYpcTeGjR
Content-Type: multipart/mixed; boundary="------------jhmGQRobVkA6ZWilxmc78Uz0"

--------------jhmGQRobVkA6ZWilxmc78Uz0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 5/16/26 17:53, Julian Braha wrote:
> Add kconfirm into scripts/
>=20
> kconfirm is a static analysis tool with various checks for Kconfig, and=

> intended to have zero false alarms by default. These default checks
> currently include dead code, constant conditions, and invalid (reverse)=

> ranges.
>=20
> There are also optional checks for dead links in the help texts, and fo=
r
> config options that select visible config options.
>=20
> Checks are performed on the same architecture as the kernel build, usin=
g
> a single thread. More architectures can be enabled by passing
> `--enable-arch`. Alarms are tagged using the architectures' config opti=
ons,
> like so: [X86] if specific to x86, or [X86, ARM] if the alarm appears f=
or
> both x86 and arm.
>=20
> Each alarm gets a single line (deduplicated across architectures) and i=
s
> formatted like this:
> [<SEVERITY>] [<ARCH_1>, <ARCH_2>] config <OPTION_NAME>: <alarm message>=

>=20
> The tool source contains two Rust packages: kconfirm-lib and
> kconfirm-linux.
>=20
> kconfirm-lib is the underlying library that analyzes Kconfig code, and
> formats alarms for usability. It analyzes the entire Linux Kconfig spec=
,
> including all architectures. This package exposes the symbol table that=
 it
> constructs so that other tools can import this library, and make use of=
 it
> for their own Kconfig analyses.
>=20
> kconfirm-linux imports kconfirm-lib, and provides the CLI, which is
> intended for either manual usage, or integration with the Linux build
> system so that users can simply run `make kconfirm` from the root.
> kconfirm-linux also handles some of the specificities of how Kconfig is=

> used in the Linux tree, in contrast to other open source software. E.g.=

> the way that each architecture has its own Kconfig and Kconfig.debug
> files.
>=20
> The tool's dependencies need to be downloaded from crates.io by running=

> `cargo vendor` in scripts/kconfirm/ before building and running the too=
l.
>=20
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---
>  Makefile                                      |  15 +-
>  scripts/Makefile                              |   2 +-
>  scripts/kconfirm/.gitignore                   |   3 +
>  scripts/kconfirm/Cargo.lock                   |  60 ++
>  scripts/kconfirm/Cargo.toml                   |  12 +
>  scripts/kconfirm/Makefile                     |  14 +
>  scripts/kconfirm/kconfirm-lib/Cargo.toml      |  12 +
>  scripts/kconfirm/kconfirm-lib/src/analyze.rs  | 643 ++++++++++++++++
>  scripts/kconfirm/kconfirm-lib/src/checks.rs   | 701 ++++++++++++++++++=

>  scripts/kconfirm/kconfirm-lib/src/curl_ffi.rs | 182 +++++
>  .../kconfirm/kconfirm-lib/src/dead_links.rs   | 138 ++++
>  scripts/kconfirm/kconfirm-lib/src/lib.rs      |  62 ++
>  scripts/kconfirm/kconfirm-lib/src/output.rs   | 111 +++
>  .../kconfirm/kconfirm-lib/src/symbol_table.rs | 223 ++++++
>  scripts/kconfirm/kconfirm-linux/Cargo.toml    |  10 +
>  .../kconfirm/kconfirm-linux/src/getopt_ffi.rs |  99 +++
>  scripts/kconfirm/kconfirm-linux/src/lib.rs    |  78 ++
>  scripts/kconfirm/kconfirm-linux/src/main.rs   | 192 +++++
>  18 files changed, 2552 insertions(+), 5 deletions(-)
>  create mode 100644 scripts/kconfirm/.gitignore
>  create mode 100644 scripts/kconfirm/Cargo.lock
>  create mode 100644 scripts/kconfirm/Cargo.toml
>  create mode 100644 scripts/kconfirm/Makefile
>  create mode 100644 scripts/kconfirm/kconfirm-lib/Cargo.toml
>  create mode 100644 scripts/kconfirm/kconfirm-lib/src/analyze.rs
>  create mode 100644 scripts/kconfirm/kconfirm-lib/src/checks.rs
>  create mode 100644 scripts/kconfirm/kconfirm-lib/src/curl_ffi.rs
>  create mode 100644 scripts/kconfirm/kconfirm-lib/src/dead_links.rs
>  create mode 100644 scripts/kconfirm/kconfirm-lib/src/lib.rs
>  create mode 100644 scripts/kconfirm/kconfirm-lib/src/output.rs
>  create mode 100644 scripts/kconfirm/kconfirm-lib/src/symbol_table.rs
>  create mode 100644 scripts/kconfirm/kconfirm-linux/Cargo.toml
>  create mode 100644 scripts/kconfirm/kconfirm-linux/src/getopt_ffi.rs
>  create mode 100644 scripts/kconfirm/kconfirm-linux/src/lib.rs
>  create mode 100644 scripts/kconfirm/kconfirm-linux/src/main.rs
>=20
> diff --git a/Makefile b/Makefile
> index b7b80e84e1eb..99aaed5bdbc5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -296,7 +296,7 @@ no-dot-config-targets :=3D $(clean-targets) \
>  			 $(version_h) headers headers_% archheaders archscripts \
>  			 %asm-generic kernelversion %src-pkg dt_binding_check \
>  			 outputmakefile rustavailable rustfmt rustfmtcheck \
> -			 run-command
> +			 run-command kconfirm
>  no-sync-config-targets :=3D $(no-dot-config-targets) %install modules_=
sign kernelrelease \
>  			  image_name
>  single-targets :=3D %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.rsi %.s =
%/
> @@ -536,6 +536,7 @@ OBJDUMP		=3D $(CROSS_COMPILE)objdump
>  READELF		=3D $(CROSS_COMPILE)readelf
>  STRIP		=3D $(CROSS_COMPILE)strip
>  endif
> +CARGO		=3D cargo
>  RUSTC		=3D rustc
>  RUSTDOC		=3D rustdoc
>  RUSTFMT		=3D rustfmt
> @@ -633,7 +634,7 @@ export RUSTC_BOOTSTRAP :=3D 1
>  export CLIPPY_CONF_DIR :=3D $(srctree)
> =20
>  export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_C=
OMPILE LD CC HOSTPKG_CONFIG
> -export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BIN=
DGEN LLVM_LINK
> +export CARGO RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIP=
PY BINDGEN LLVM_LINK
>  export HOSTRUSTC KBUILD_HOSTRUSTFLAGS
>  export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS L=
EX YACC AWK INSTALLKERNEL
>  export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
> @@ -1705,7 +1706,7 @@ MRPROPER_FILES +=3D include/config include/genera=
ted          \
>  		  vmlinux-gdb.py \
>  		  rpmbuild \
>  		  rust/libmacros.so rust/libmacros.dylib \
> -		  rust/libpin_init_internal.so rust/libpin_init_internal.dylib
> +		  rust/libpin_init_internal.so rust/libpin_init_internal.dylib \
> =20
>  # clean - Delete most, but leave enough to build external modules
>  #
> @@ -2227,7 +2228,7 @@ endif
>  # Scripts to check various things for consistency
>  # --------------------------------------------------------------------=
-------
> =20
> -PHONY +=3D includecheck versioncheck coccicheck
> +PHONY +=3D includecheck versioncheck coccicheck kconfirm
> =20
>  includecheck:
>  	find $(srctree)/* $(RCS_FIND_IGNORE) \
> @@ -2242,6 +2243,12 @@ versioncheck:
>  coccicheck:
>  	$(Q)$(BASH) $(srctree)/scripts/$@
> =20
> +
> +kconfirm:
> +	$(Q)$(MAKE) -C $(srctree)/scripts/kconfirm srctree=3D$(abs_srctree) S=
RCARCH=3D$(SRCARCH) || \
> +		(printf "\n  kconfirm failed to compile and run. Have you set up its=
 dependencies yet?\n  See Documentation/dev-tools/kconfirm.rst\n\n" && fa=
lse)
> +clean-dirs +=3D scripts/kconfirm
> +
>  PHONY +=3D checkstack kernelrelease kernelversion image_name
> =20
>  # UML needs a little special treatment here.  It wants to use the host=

> diff --git a/scripts/Makefile b/scripts/Makefile
> index 3434a82a119f..460655bd2de1 100644
> --- a/scripts/Makefile
> +++ b/scripts/Makefile
> @@ -66,4 +66,4 @@ subdir-$(CONFIG_SECURITY_SELINUX) +=3D selinux
>  subdir-$(CONFIG_SECURITY_IPE) +=3D ipe
> =20
>  # Let clean descend into subdirs
> -subdir-	+=3D basic dtc gdb kconfig mod
> +subdir-	+=3D basic dtc gdb kconfig kconfirm mod
> diff --git a/scripts/kconfirm/.gitignore b/scripts/kconfirm/.gitignore
> new file mode 100644
> index 000000000000..f63ee0251591
> --- /dev/null
> +++ b/scripts/kconfirm/.gitignore
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +/target
> +/vendor
> diff --git a/scripts/kconfirm/Cargo.lock b/scripts/kconfirm/Cargo.lock
> new file mode 100644
> index 000000000000..d90bc7d2e2a3
> --- /dev/null
> +++ b/scripts/kconfirm/Cargo.lock
> @@ -0,0 +1,60 @@
> +# This file is automatically @generated by Cargo.
> +# It is not intended for manual editing.
> +version =3D 4
> +
> +[[package]]
> +name =3D "bytecount"
> +version =3D "0.6.9"
> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
> +checksum =3D "175812e0be2bccb6abe50bb8d566126198344f707e304f45c648fd8f=
2cc0365e"
> +
> +[[package]]
> +name =3D "kconfirm-lib"
> +version =3D "0.10.0"
> +dependencies =3D [
> + "nom-kconfig",
> +]
> +
> +[[package]]
> +name =3D "kconfirm-linux"
> +version =3D "0.10.0"
> +dependencies =3D [
> + "kconfirm-lib",
> + "nom-kconfig",
> +]
> +
> +[[package]]
> +name =3D "memchr"
> +version =3D "2.8.0"
> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
> +checksum =3D "f8ca58f447f06ed17d5fc4043ce1b10dd205e060fb3ce5b979b8ed8e=
59ff3f79"
> +
> +[[package]]
> +name =3D "nom"
> +version =3D "8.0.0"
> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
> +checksum =3D "df9761775871bdef83bee530e60050f7e54b1105350d6884eb0fb4f4=
6c2f9405"
> +dependencies =3D [
> + "memchr",
> +]
> +
> +[[package]]
> +name =3D "nom-kconfig"
> +version =3D "0.11.0"
> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
> +checksum =3D "5a0220bb2c8e5ad29b06fe0f75a276affeb10c9504726bf46d81fef7=
8d69b1e3"
> +dependencies =3D [
> + "nom",
> + "nom_locate",
> +]
> +
> +[[package]]
> +name =3D "nom_locate"
> +version =3D "5.0.0"
> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
> +checksum =3D "0b577e2d69827c4740cba2b52efaad1c4cc7c73042860b199710b357=
5c68438d"
> +dependencies =3D [
> + "bytecount",
> + "memchr",
> + "nom",
> +]
> diff --git a/scripts/kconfirm/Cargo.toml b/scripts/kconfirm/Cargo.toml
> new file mode 100644
> index 000000000000..5880b06c4116
> --- /dev/null
> +++ b/scripts/kconfirm/Cargo.toml
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0
> +[workspace]
> +members =3D ["kconfirm-lib", "kconfirm-linux"]
> +resolver =3D "3"
> +
> +[workspace.package]
> +rust-version =3D "1.85.0"
> +
> +[workspace.dependencies]
> +nom-kconfig =3D { version =3D "0.11", default-features =3D false, feat=
ures =3D [
> +    "display",
> +] }
> diff --git a/scripts/kconfirm/Makefile b/scripts/kconfirm/Makefile
> new file mode 100644
> index 000000000000..6a0b7389103e
> --- /dev/null
> +++ b/scripts/kconfirm/Makefile
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# kconfirm makefile
> +
> +TARGET :=3D kconfirm
> +
> +# Extra arguments forwarded to kconfirm.
> +# Example: make kconfirm KCONFIRM_ARGS=3D"--enable-check dead_links"
> +KCONFIRM_ARGS ?=3D
> +
> +$(TARGET):
> +	$(CARGO) run --release --offline -p kconfirm-linux -- --linux-path $(=
srctree) --enable-arch $(SRCARCH) $(KCONFIRM_ARGS)
> +
> +
> +clean-files +=3D target vendor
> diff --git a/scripts/kconfirm/kconfirm-lib/Cargo.toml b/scripts/kconfir=
m/kconfirm-lib/Cargo.toml
> new file mode 100644
> index 000000000000..dd3d7cb1aa1d
> --- /dev/null
> +++ b/scripts/kconfirm/kconfirm-lib/Cargo.toml
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0
> +[package]
> +name =3D "kconfirm-lib"
> +version =3D "0.10.0"
> +edition =3D "2024"
> +rust-version.workspace =3D true
> +
> +[dependencies]
> +nom-kconfig =3D { workspace =3D true }
> +
> +[features]
> +default =3D []
> diff --git a/scripts/kconfirm/kconfirm-lib/src/analyze.rs b/scripts/kco=
nfirm/kconfirm-lib/src/analyze.rs
> new file mode 100644
> index 000000000000..24798581dc3d
> --- /dev/null
> +++ b/scripts/kconfirm/kconfirm-lib/src/analyze.rs
> @@ -0,0 +1,643 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +use crate::AnalysisArgs;
> +use crate::Check;
> +use crate::SymbolTable;
> +use crate::dead_links;
> +use crate::dead_links::LinkStatus;
> +use crate::dead_links::check_link;
> +use crate::output::Finding;
> +use crate::output::Severity;
> +use crate::symbol_table::ChoiceData;
> +use nom_kconfig::Attribute::*;
> +use nom_kconfig::Entry;
> +use nom_kconfig::attribute::DefaultAttribute;
> +use nom_kconfig::attribute::Expression;
> +use nom_kconfig::attribute::Imply;
> +use nom_kconfig::attribute::Select;
> +use nom_kconfig::attribute::r#type::Type;
> +use nom_kconfig::entry::Choice;
> +use nom_kconfig::entry::Config;
> +use nom_kconfig::entry::If;
> +use nom_kconfig::entry::Menu;
> +use nom_kconfig::entry::Source;
> +use std::collections::HashSet;
> +use std::option::Option;
> +
> +#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
> +enum FunctionalAttributes {
> +    // only tracking the attributes that affect the semantics, e.g. no=
t help texts
> +    Dependencies,
> +    Selects,
> +    Implies,
> +    Ranges,
> +    Defaults,
> +}
> +
> +struct AttributeGroupingChecker {
> +    current_group: Option<FunctionalAttributes>,
> +    finished_groups: HashSet<FunctionalAttributes>,
> +}
> +
> +impl AttributeGroupingChecker {
> +    fn new() -> Self {
> +        Self {
> +            current_group: None,
> +            finished_groups: HashSet::new(),
> +        }
> +    }
> +
> +    // doesn't modify `findings` if the style check is disabled
> +    fn check(
> +        &mut self,
> +        group: FunctionalAttributes,
> +        args: &AnalysisArgs,
> +        findings: &mut Vec<Finding>,
> +        symbol: &str,
> +        arch: &String,
> +        message: String,
> +    ) {
> +        if !args.is_enabled(Check::UngroupedAttribute) {
> +            return;
> +        }
> +
> +        match self.current_group {
> +            // still contiguous
> +            Some(current) if current =3D=3D group =3D> {}
> +
> +            // start of group
> +            None =3D> {
> +                self.current_group =3D Some(group);
> +            }
> +
> +            Some(current) =3D> {
> +                // the previous group finished
> +                self.finished_groups.insert(current);
> +
> +                // we've already finished this group, it's ungrouped
> +                if self.finished_groups.contains(&group) {
> +                    findings.push(Finding {
> +                        severity: Severity::Style,
> +                        check: Check::UngroupedAttribute,
> +                        symbol: Some(symbol.to_string()),
> +                        message,
> +                        arch: arch.to_owned(),
> +                    });
> +                }
> +
> +                // switch to the new group
> +                self.current_group =3D Some(group);
> +            }
> +        }
> +    }
> +}
> +
> +struct DeadLinkChecker {
> +    visited_links: HashSet<String>,
> +}
> +
> +impl DeadLinkChecker {
> +    fn new() -> Self {
> +        Self {
> +            visited_links: HashSet::new(),
> +        }
> +    }
> +
> +    fn check_text(
> +        &mut self,
> +        text: &str,
> +        args: &AnalysisArgs,
> +        findings: &mut Vec<Finding>,
> +        symbol: Option<&str>,
> +        arch: &String,
> +        context: &str,
> +    ) {
> +        if !args.is_enabled(Check::DeadLink) {
> +            return;
> +        }
> +
> +        let links =3D dead_links::find_links(text);
> +
> +        if links.is_empty() {
> +            return;
> +        }
> +
> +        for link in links {
> +            // avoid rechecking identical links
> +            if !self.visited_links.insert(link.clone()) {
> +                continue;
> +            }
> +
> +            let status =3D check_link(&link);
> +            if status !=3D LinkStatus::Ok && status !=3D LinkStatus::P=
robablyBlocked {
> +                findings.push(Finding {
> +                    severity: Severity::Warning,
> +                    check: Check::DeadLink,
> +                    symbol: symbol.map(|s| s.to_string()),
> +                    message: format!(
> +                        "{} contains link {} with status {:?}",
> +                        context, link, status
> +                    ),
> +                    arch: arch.to_owned(),
> +                });
> +            }
> +        }
> +    }
> +}
> +
> +#[derive(Clone)]
> +pub struct Context {
> +    pub arch: String,
> +    pub definition_condition: Vec<Expression>,
> +    pub visibility: Vec<Option<Expression>>,
> +    pub dependencies: Vec<Expression>,
> +    pub in_choice: bool,
> +}
> +
> +impl Context {
> +    fn with_arch(arch: String) -> Context {
> +        Context {
> +            arch,
> +            definition_condition: vec![],
> +            visibility: vec![],
> +            dependencies: vec![],
> +            in_choice: false,
> +        }
> +    }
> +
> +    fn child(&self) -> Self {
> +        self.clone()
> +    }
> +
> +    fn with_dep(mut self, dep: Expression) -> Self {
> +        self.dependencies.push(dep);
> +        self
> +    }
> +
> +    fn with_visibility(mut self, cond: Option<Expression>) -> Self {
> +        self.visibility.push(cond);
> +        self
> +    }
> +
> +    fn with_definition(mut self, cond: Expression) -> Self {
> +        self.definition_condition.push(cond);
> +        self
> +    }
> +
> +    fn in_choice(mut self) -> Self {
> +        self.in_choice =3D true;
> +        self
> +    }
> +}
> +
> +fn recurse_entries(
> +    args: &AnalysisArgs,
> +    symtab: &mut SymbolTable,
> +    entries: Vec<Entry>,
> +    ctx: Context,
> +    findings: &mut Vec<Finding>,
> +) {
> +    for entry in entries {
> +        process_entry(args, symtab, entry, ctx.clone(), findings);
> +    }
> +}
> +
> +pub fn analyze(
> +    args: &AnalysisArgs,
> +    symtab: &mut SymbolTable,
> +    arch: String,
> +    entries: Vec<Entry>,
> +) -> Vec<Finding> {
> +    let mut findings =3D Vec::new();
> +
> +    let ctx =3D Context::with_arch(arch);
> +
> +    recurse_entries(args, symtab, entries, ctx, &mut findings);
> +
> +    findings
> +}
> +
> +fn handle_config(
> +    args: &AnalysisArgs,
> +    symtab: &mut SymbolTable,
> +    entry: Config,
> +    ctx: &Context,
> +    findings: &mut Vec<Finding>,
> +) {
> +    let config_symbol =3D entry.symbol;
> +
> +    let mut child_ctx =3D ctx.child();
> +
> +    let mut config_type =3D None;
> +    let mut kconfig_dependencies =3D Vec::new();
> +    let mut kconfig_selects: Vec<Select> =3D Vec::new();
> +    let mut kconfig_implies: Vec<Imply> =3D Vec::new();
> +    let mut kconfig_ranges =3D Vec::new();
> +    let mut kconfig_defaults =3D Vec::new();
> +    let mut found_prompt =3D false;
> +
> +    /*
> +     * style check: ungrouped attributes
> +     * - need to check that dependencies, selects, ranges, and default=
s are each kept together.
> +     */
> +    let mut attribute_grouping_checker =3D AttributeGroupingChecker::n=
ew();
> +    let mut dead_link_checker =3D DeadLinkChecker::new();
> +    for attribute in entry.attributes {
> +        match attribute {
> +            Type(kconfig_type) =3D> match kconfig_type.r#type.clone() =
{
> +                // hybrid type definition and default
> +                Type::DefBool(db) =3D> {
> +                    let default_attribute: DefaultAttribute =3D Defaul=
tAttribute {
> +                        expression: db.clone(),
> +                        r#if: kconfig_type.clone().r#if,
> +                    };
> +
> +                    kconfig_defaults.push(default_attribute);
> +                    config_type =3D Some(kconfig_type);
> +
> +                    // NOTE: as a style, we prefer to keep the hybrid =
default-typedef with the standalone defaults
> +                    attribute_grouping_checker.check(
> +                        FunctionalAttributes::Defaults,
> +                        args,
> +                        findings,
> +                        &config_symbol,
> +                        &ctx.arch,
> +                        format!("ungrouped default {}", db),
> +                    );
> +                }
> +                Type::Bool(unconditional_prompt) =3D> {
> +                    if unconditional_prompt.is_some() {
> +                        found_prompt =3D true;
> +                    }
> +                    config_type =3D Some(kconfig_type);
> +                }
> +
> +                // hybrid type definition and default
> +                Type::DefTristate(dt) =3D> {
> +                    // NOTE: as a style, we prefer to keep the hybrid =
default-typedef with the standalone defaults
> +                    attribute_grouping_checker.check(
> +                        FunctionalAttributes::Defaults,
> +                        args,
> +                        findings,
> +                        &config_symbol,
> +                        &ctx.arch,
> +                        format!("ungrouped default {}", &dt),
> +                    );
> +
> +                    let default_attribute: DefaultAttribute =3D Defaul=
tAttribute {
> +                        expression: dt,
> +                        r#if: kconfig_type.clone().r#if,
> +                    };
> +
> +                    kconfig_defaults.push(default_attribute);
> +                    config_type =3D Some(kconfig_type);
> +                }
> +                Type::Tristate(unconditional_prompt) =3D> {
> +                    if unconditional_prompt.is_some() {
> +                        found_prompt =3D true;
> +                    }
> +
> +                    config_type =3D Some(kconfig_type.clone())
> +                }
> +                Type::Hex(unconditional_prompt) =3D> {
> +                    if unconditional_prompt.is_some() {
> +                        found_prompt =3D true;
> +                    }
> +
> +                    config_type =3D Some(kconfig_type);
> +                }
> +                Type::Int(unconditional_prompt) =3D> {
> +                    if unconditional_prompt.is_some() {
> +                        found_prompt =3D true;
> +                    }
> +                    config_type =3D Some(kconfig_type);
> +                }
> +                Type::String(unconditional_prompt) =3D> {
> +                    if unconditional_prompt.is_some() {
> +                        found_prompt =3D true;
> +                    }
> +                    config_type =3D Some(kconfig_type);
> +                }
> +            },
> +            Default(default) =3D> {
> +                attribute_grouping_checker.check(
> +                    FunctionalAttributes::Defaults,
> +                    args,
> +                    findings,
> +                    &config_symbol,
> +                    &ctx.arch,
> +                    format!("ungrouped default {}", &default),
> +                );
> +
> +                kconfig_defaults.push(default);
> +            }
> +
> +            DependsOn(depends_on) =3D> {
> +                attribute_grouping_checker.check(
> +                    FunctionalAttributes::Dependencies,
> +                    args,
> +                    findings,
> +                    &config_symbol,
> +                    &ctx.arch,
> +                    format!("ungrouped dependency {}", &depends_on),
> +                );
> +
> +                kconfig_dependencies.push(depends_on);
> +            }
> +            Select(select) =3D> {
> +                attribute_grouping_checker.check(
> +                    FunctionalAttributes::Selects,
> +                    args,
> +                    findings,
> +                    &config_symbol,
> +                    &ctx.arch,
> +                    format!("ungrouped select {}", &select),
> +                );
> +
> +                kconfig_selects.push(select);
> +            }
> +            Imply(imply) =3D> {
> +                attribute_grouping_checker.check(
> +                    FunctionalAttributes::Implies,
> +                    args,
> +                    findings,
> +                    &config_symbol,
> +                    &ctx.arch,
> +                    format!("ungrouped imply {}", imply),
> +                );
> +
> +                kconfig_implies.push(imply);
> +
> +                // TODO: may be relevant for nonvisible config options=
 when building an SMT model...
> +            }
> +            // NOTE: range bounds are inclusive
> +            Range(r) =3D> {
> +                attribute_grouping_checker.check(
> +                    FunctionalAttributes::Ranges,
> +                    args,
> +                    findings,
> +                    &config_symbol,
> +                    &ctx.arch,
> +                    format!("ungrouped range {}", r),
> +                );
> +
> +                kconfig_ranges.push(r);
> +            }
> +            Help(h) =3D> {
> +                // doing nothing for menu help right now
> +
> +                dead_link_checker.check_text(
> +                    &h,
> +                    args,
> +                    findings,
> +                    Some(&config_symbol),
> +                    &ctx.arch,
> +                    "help text",
> +                );
> +            }
> +
> +            Modules =3D> {
> +                // the modules attribute designates this config option=
 as the one that determines if the `m` state is available for tristates o=
ptions.
> +
> +                // just making a special note of this in the symtab fo=
r now...
> +                symtab.modules_option =3D Some(config_symbol.clone());=

> +            }
> +
> +            // the prompt's option `if` determines "visibility"
> +            Prompt(prompt) =3D> {
> +                // TODO: once we have SMT solving, we can also check i=
f the prompt condition is always true or never true (and therefore, effec=
tively unconditional)
> +
> +                found_prompt =3D true;
> +                if let Some(c) =3D prompt.r#if {
> +                    child_ctx =3D child_ctx.with_visibility(Some(c));
> +                }
> +            }
> +            Transitional =3D> {
> +                // doing nothing for transitional right now
> +            }
> +            Optional | Visible(_) | Requires(_) | Option(_) =3D> {
> +                eprintln!("Error: unexpected attribute encountered: {:=
?}", attribute);
> +
> +                if cfg!(debug_assertions) {
> +                    panic!();
> +                }
> +            }
> +        }
> +    }
> +
> +    if !found_prompt {
> +        child_ctx =3D child_ctx.with_visibility(None);
> +    }
> +
> +    // there can be multiple entries that get merged. so we need to do=
 the same for our symtab.
> +    let kconfig_type =3D config_type.clone().map(|c| c.r#type);
> +
> +    // at the time of writing this, linux's kconfig only uses Bool ins=
ide Choice.
> +    // however, the kconfig documentation doesn't specify whether or n=
ot this is guaranteed to be the case.
> +    // we add this check to ensure that we don't cause undefined behav=
ior in future linux versions if something changes...
> +    if child_ctx.in_choice {
> +        if let Some(kt) =3D &kconfig_type {
> +            match kt {
> +                Type::Bool(_) | Type::DefBool(_) =3D> {
> +                    // expected in a choice...
> +                }
> +
> +                _ =3D> {
> +                    // TODO: old versions of linux (like 5.4.4) have t=
ristates in the choice
> +                    //       - u-boot also currently has hex options i=
n the choice!
> +                    eprintln!(
> +                        "Error: found something unexpected in a choice=
-statement: {:?}",
> +                        kt
> +                    );
> +                }
> +            }
> +        }
> +    }
> +
> +    // at the end, add the file's cur_dependencies to this var's invid=
idual dependencies.
> +    kconfig_dependencies.extend(child_ctx.dependencies.clone());
> +    symtab.merge_insert_new_solved(
> +        config_symbol.clone(),
> +        kconfig_type,
> +        kconfig_dependencies,
> +        //z3_dependency,
> +        kconfig_ranges,
> +        kconfig_defaults,
> +        child_ctx.visibility.clone(),
> +        child_ctx.arch.clone(),
> +        child_ctx.definition_condition.clone(),
> +        None,
> +        kconfig_selects
> +            .clone()
> +            .into_iter()
> +            .map(|sel| (sel.symbol, sel.r#if))
> +            .collect(),
> +        kconfig_implies
> +            .into_iter()
> +            .map(|imply| (imply.symbol.to_string(), imply.r#if))
> +            .collect(),
> +    );
> +    // TODO: file a github issue, imply can never imply a constant (th=
is is technically parsing incorrectly)
> +
> +    // TODO: when SMT solving, we may need to keep track of the implie=
s the same way we keep track of selects,
> +    //       in cases when the implied config option is non-visible
> +
> +    // need to add the select condition to the definedness condition i=
f it exists
> +    for select in kconfig_selects {
> +        match select.r#if {
> +            None =3D> symtab.merge_insert_new_solved(
> +                select.symbol,
> +                None,
> +                Vec::new(),
> +                Vec::new(),
> +                Vec::new(),
> +                Vec::new(),
> +                child_ctx.arch.clone(),
> +                child_ctx.definition_condition.clone(),
> +                Some((config_symbol.clone(), None)),
> +                Vec::new(),
> +                Vec::new(),
> +            ),
> +            Some(select_condition) =3D> {
> +                symtab.merge_insert_new_solved(
> +                    select.symbol,
> +                    None,
> +                    Vec::new(),
> +                    Vec::new(),
> +                    Vec::new(),
> +                    Vec::new(),
> +                    child_ctx.arch.clone(),
> +                    child_ctx.definition_condition.clone(),
> +                    Some((config_symbol.clone(), Some(select_condition=
))),
> +                    Vec::new(),
> +                    Vec::new(),
> +                );
> +            }
> +        }
> +    }
> +}
> +
> +fn handle_menu(
> +    args: &AnalysisArgs,
> +    symtab: &mut SymbolTable,
> +    entry: Menu,
> +    ctx: &Context,
> +    findings: &mut Vec<Finding>,
> +) {
> +    // menus can set the visibility of their menu items
> +
> +    let mut child_ctx =3D ctx.child();
> +
> +    for dep in entry.depends_on {
> +        child_ctx =3D child_ctx.with_dep(dep.clone());
> +        child_ctx =3D child_ctx.with_visibility(Some(dep)); // not a t=
ypo, the config options inside of a menu are only visible if the menu's d=
ependencies are satisfied
> +    }
> +
> +    let nested_entries =3D entry.entries;
> +
> +    recurse_entries(args, symtab, nested_entries, child_ctx.clone(), f=
indings);
> +}
> +
> +fn handle_choice(
> +    args: &AnalysisArgs,
> +    symtab: &mut SymbolTable,
> +    entry: Choice,
> +    ctx: &Context,
> +    findings: &mut Vec<Finding>,
> +) {
> +    let mut child_ctx =3D ctx.child();
> +    child_ctx =3D child_ctx.in_choice();
> +
> +    // we are going to add the dependencies of the choice to the depen=
dencies of the entries.
> +    //   we start with the dependencies inherited from the file
> +    let mut choice_visibility_condition =3D None;
> +    let mut defaults =3D Vec::new();
> +    for attribute in entry.options {
> +        match attribute {
> +            DependsOn(depends_on) =3D> {
> +                child_ctx =3D child_ctx.with_dep(depends_on);
> +            }
> +
> +            Default(default) =3D> {
> +                defaults.push(default);
> +            }
> +
> +            // the prompt's `if` determines visibility
> +            Prompt(prompt) =3D> {
> +                choice_visibility_condition =3D prompt.r#if;
> +                if let Some(i) =3D choice_visibility_condition.clone()=
 {
> +                    child_ctx =3D child_ctx.with_visibility(Some(i));
> +                }
> +            }
> +            _ =3D> {
> +                // skip
> +            }
> +        }
> +    }
> +
> +    // all of the variables in the choice menu
> +    //let mut contained_vars =3D Vec::with_capacity(c.entries.len());
> +    let nested_entries =3D entry.entries;
> +
> +    recurse_entries(args, symtab, nested_entries, child_ctx.clone(), f=
indings);
> +
> +    let choice_data =3D ChoiceData {
> +        //inner_vars: contained_vars,
> +        arch: child_ctx.arch.clone(),
> +        visibility: choice_visibility_condition,
> +        dependencies: child_ctx.dependencies,
> +        defaults,
> +    };
> +    symtab.choices.push(choice_data);
> +}
> +
> +fn handle_if(
> +    args: &AnalysisArgs,
> +    symtab: &mut SymbolTable,
> +    entry: If,
> +    ctx: &Context,
> +    findings: &mut Vec<Finding>,
> +) {
> +    let mut child_ctx =3D ctx.child();
> +    child_ctx =3D child_ctx.with_definition(entry.condition.clone());
> +    child_ctx =3D child_ctx.with_dep(entry.condition);
> +    let nested_entries =3D entry.entries;
> +
> +    recurse_entries(args, symtab, nested_entries, child_ctx, findings)=
;
> +}
> +
> +fn handle_source(
> +    args: &AnalysisArgs,
> +    symtab: &mut SymbolTable,
> +    entry: Source,
> +    ctx: &Context,
> +    findings: &mut Vec<Finding>,
> +) {
> +    let sourced_kconfig =3D entry.kconfigs;
> +
> +    for sourced_kconfig in sourced_kconfig {
> +        recurse_entries(args, symtab, sourced_kconfig.entries, ctx.clo=
ne(), findings);
> +    }
> +}
> +
> +pub fn process_entry(
> +    args: &AnalysisArgs,
> +    symtab: &mut SymbolTable,
> +    entry: Entry,
> +    ctx: Context,
> +    findings: &mut Vec<Finding>,
> +) {
> +    // NOTE: in general, each handler should update the context as it =
encounters that construct.
> +    //       e.g. Context.in_choice() should be called at the start of=
 handle_choice(), not right before call to process_entry() when a choice =
is found and process_entry is called
> +    match entry {
> +        Entry::Config(c) | Entry::MenuConfig(c) =3D> {
> +            handle_config(args, symtab, c, &ctx, findings);
> +        }
> +        Entry::Menu(m) =3D> handle_menu(args, symtab, m, &ctx, finding=
s),
> +        Entry::Choice(c) =3D> handle_choice(args, symtab, c, &ctx, fin=
dings),
> +        Entry::If(i) =3D> handle_if(args, symtab, i, &ctx, findings),
> +        Entry::Source(s) =3D> handle_source(args, symtab, s, &ctx, fin=
dings),
> +        Entry::Comment(_) =3D> {}
> +        Entry::MainMenu(_) =3D> {}
> +        _ =3D> {}
> +    }
> +}
> diff --git a/scripts/kconfirm/kconfirm-lib/src/checks.rs b/scripts/kcon=
firm/kconfirm-lib/src/checks.rs
> new file mode 100644
> index 000000000000..2ad67f4390ea
> --- /dev/null
> +++ b/scripts/kconfirm/kconfirm-lib/src/checks.rs
> @@ -0,0 +1,701 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +use crate::output::Finding;
> +use crate::output::Severity;
> +use crate::symbol_table::AttributeDef;
> +use crate::symbol_table::TypeInfo;
> +use nom_kconfig::attribute::Expression;
> +use nom_kconfig::attribute::range::RangeBound;
> +use std::collections::HashSet;
> +use std::num::ParseIntError;
> +use std::str::FromStr;
> +
> +#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
> +pub enum Check {
> +    FailedParse,
> +    UngroupedAttribute, // check for duplicate default values, and ung=
rouped attributes
> +    DeadLink,           // check for dead links in the help texts
> +    SelectVisible,
> +    // need SMT solving before we can detect select-undefineds
> +    //SelectUndefined,
> +    DuplicateDependency,
> +    DuplicateRange,
> +    DeadRange,
> +    DuplicateSelect,
> +    DeadSelect,
> +    DeadDefault,
> +    ConstantCondition,
> +    DuplicateDefault,
> +    DuplicateDefaultValue,
> +    DuplicateImply,
> +    DeadImply,
> +    ReverseRange,
> +}
> +
> +impl Check {
> +    pub fn as_str(self) -> &'static str {
> +        match self {
> +            Check::FailedParse =3D> "failed_parse",
> +            Check::UngroupedAttribute =3D> "ungrouped_attribute",
> +            Check::DeadLink =3D> "dead_link",
> +            Check::SelectVisible =3D> "select_visible",
> +            Check::DuplicateDependency =3D> "duplicate_dependency",
> +            Check::DuplicateRange =3D> "duplicate_range",
> +            Check::DeadRange =3D> "dead_range",
> +            Check::DuplicateSelect =3D> "duplicate_select",
> +            Check::DeadSelect =3D> "dead_select",
> +            Check::DeadDefault =3D> "dead_default",
> +            Check::ConstantCondition =3D> "constant_condition",
> +            Check::DuplicateDefault =3D> "duplicate_default",
> +            Check::DuplicateDefaultValue =3D> "duplicate_default_value=
",
> +            Check::DuplicateImply =3D> "duplicate_imply",
> +            Check::DeadImply =3D> "dead_imply",
> +            Check::ReverseRange =3D> "reverse_range",
> +        }
> +    }
> +}
> +
> +#[derive(Debug)]
> +pub struct ParseCheckError {
> +    pub input: String,
> +}
> +
> +impl std::fmt::Display for ParseCheckError {
> +    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result=
 {
> +        write!(f, "unknown check '{}'", self.input)
> +    }
> +}
> +
> +impl std::error::Error for ParseCheckError {}
> +
> +impl FromStr for Check {
> +    type Err =3D ParseCheckError;
> +
> +    fn from_str(name: &str) -> Result<Self, Self::Err> {
> +        match name {
> +            "failed_parse" =3D> Ok(Check::FailedParse),
> +            "ungrouped_attribute" =3D> Ok(Check::UngroupedAttribute),
> +            "dead_link" =3D> Ok(Check::DeadLink),
> +            "select_visible" =3D> Ok(Check::SelectVisible),
> +            "duplicate_dependency" =3D> Ok(Check::DuplicateDependency)=
,
> +            "duplicate_range" =3D> Ok(Check::DuplicateRange),
> +            "dead_range" =3D> Ok(Check::DeadRange),
> +            "duplicate_select" =3D> Ok(Check::DuplicateSelect),
> +            "dead_select" =3D> Ok(Check::DeadSelect),
> +            "dead_default" =3D> Ok(Check::DeadDefault),
> +            "constant_condition" =3D> Ok(Check::ConstantCondition),
> +            "duplicate_default" =3D> Ok(Check::DuplicateDefault),
> +            "duplicate_default_value" =3D> Ok(Check::DuplicateDefaultV=
alue),
> +            "duplicate_imply" =3D> Ok(Check::DuplicateImply),
> +            "dead_imply" =3D> Ok(Check::DeadImply),
> +            "reverse_range" =3D> Ok(Check::ReverseRange),
> +            _ =3D> Err(ParseCheckError {
> +                input: name.to_string(),
> +            }),
> +        }
> +    }
> +}
> +
> +#[derive(Clone, Debug)]
> +pub struct AnalysisArgs {
> +    // check for duplicate default values
> +    pub enabled_checks: HashSet<Check>,
> +}
> +
> +impl AnalysisArgs {
> +    pub fn is_enabled(&self, check: Check) -> bool {
> +        self.enabled_checks.contains(&check)
> +    }
> +}
> +
> +// returns an Error if a hex range bound cannot be parsed as an u64
> +pub fn check_reverse_ranges(arch: &String, var_symbol: &str, info: &At=
tributeDef) -> Vec<Finding> {
> +    let mut findings =3D Vec::new();
> +
> +    for range in &info.kconfig_ranges {
> +        // returns an Error if a hex range bound cannot be parsed as a=
n u64
> +        fn range_bound_to_int(range_bound: &RangeBound) -> Result<i128=
, ParseIntError> {
> +            match range_bound {
> +                RangeBound::Number(b) =3D> {
> +                    return Ok(b.to_owned() as i128);
> +                }
> +                RangeBound::Hex(b_str) =3D> {
> +                    let trimmed =3D b_str.trim_start_matches("0x").tri=
m_start_matches("0X");
> +
> +                    return i128::from_str_radix(trimmed, 16);
> +                }
> +                RangeBound::Variable(_) =3D> {
> +                    // for now, the caller is expected not to pass the=
se cases.
> +                    unreachable!("not handling variable ranges until S=
MT solving");
> +                }
> +                RangeBound::Symbol(_) =3D> {
> +                    // TODO: need SMT solving for this case
> +                    //       for now, the caller is expected not to pa=
ss these cases.
> +                    unreachable!("not handling CONFIG ranges until SMT=
 solving");
> +                }
> +            }
> +        }
> +
> +        if matches!(range.lower_bound, RangeBound::Symbol(_))
> +            || matches!(range.upper_bound, RangeBound::Symbol(_))
> +        {
> +            // not handling these cases until SMT solving.
> +            // don't return though, because we stil want to check the =
other ranges.
> +            continue;
> +        }
> +
> +        let maybe_lower_bound =3D range_bound_to_int(&range.lower_boun=
d);
> +        let maybe_upper_bound =3D range_bound_to_int(&range.upper_boun=
d);
> +
> +        match (maybe_lower_bound, maybe_upper_bound) {
> +            (Ok(lower_bound), Ok(upper_bound)) =3D> {
> +                if lower_bound > upper_bound {
> +                    let message =3D format!(
> +                        "reverse range {} for config option: {}, no va=
lue is valid",
> +                        range.to_string(),
> +                        var_symbol,
> +                    );
> +                    findings.push(Finding {
> +                        severity: Severity::Warning,
> +                        check: Check::ReverseRange,
> +                        symbol: Some(var_symbol.to_owned()),
> +                        arch: arch.to_owned(),
> +                        message,
> +                    });
> +                }
> +            }
> +            (Result::Err(_), _) | (_, Result::Err(_)) =3D> {
> +                eprintln!(
> +                    "Error: couldn't parse hex range bound as i128 for=
 config option: {}",
> +                    var_symbol
> +                );
> +                // still want to check the other range bounds
> +                continue;
> +            }
> +        }
> +    }
> +
> +    findings
> +}
> +
> +pub fn check_constant_conditions(
> +    arch: &String,
> +    var_symbol: &str,
> +    info: &AttributeDef,
> +) -> Vec<Finding> {
> +    let mut findings =3D Vec::new();
> +    let default_conditions: Vec<&Expression> =3D info
> +        .kconfig_defaults
> +        .iter()
> +        .filter_map(|conditional_default| conditional_default.r#if.as_=
ref())
> +        .collect();
> +
> +    check_conditions(
> +        arch,
> +        &mut findings,
> +        &var_symbol,
> +        &info.kconfig_dependencies,
> +        default_conditions,
> +        "default",
> +    );
> +
> +    let select_conditions: Vec<&Expression> =3D info
> +        .selects
> +        .iter()
> +        .filter_map(|conditional_select| conditional_select.1.as_ref()=
)
> +        .collect();
> +
> +    check_conditions(
> +        arch,
> +        &mut findings,
> +        var_symbol,
> +        &info.kconfig_dependencies,
> +        select_conditions,
> +        "select",
> +    );
> +
> +    let imply_conditions: Vec<&Expression> =3D info
> +        .implies
> +        .iter()
> +        .filter_map(|imp| imp.1.as_ref())
> +        .collect();
> +
> +    check_conditions(
> +        arch,
> +        &mut findings,
> +        var_symbol,
> +        &info.kconfig_dependencies,
> +        imply_conditions,
> +        "imply",
> +    );
> +
> +    let range_conditions: Vec<&Expression> =3D info
> +        .kconfig_ranges
> +        .iter()
> +        .filter_map(|conditional_range| conditional_range.r#if.as_ref(=
))
> +        .collect();
> +
> +    check_conditions(
> +        arch,
> +        &mut findings,
> +        var_symbol,
> +        &info.kconfig_dependencies,
> +        range_conditions,
> +        "range",
> +    );
> +
> +    fn check_conditions(
> +        arch: &String,
> +        findings: &mut Vec<Finding>,
> +        symbol: &str,
> +        kconfig_dependencies: &[Expression],
> +        attribute_conditions: Vec<&Expression>,
> +        context: &str,
> +    ) {
> +        for attribute_condition in attribute_conditions.into_iter() {
> +            if kconfig_dependencies.contains(attribute_condition) {
> +                let message =3D format!(
> +                    "constant {} condition 'if {}' for config option: =
{}, this condition is a dependency and will always be true",
> +                    context,
> +                    attribute_condition.to_string(),
> +                    symbol,
> +                );
> +                findings.push(Finding {
> +                    severity: Severity::Warning,
> +                    check: Check::ConstantCondition,
> +                    symbol: Some(symbol.to_owned()),
> +                    arch: arch.to_owned(),
> +                    message,
> +                });
> +            }
> +        }
> +    }
> +    findings
> +}
> +
> +pub fn check_variable_info(
> +    args: &AnalysisArgs,
> +    var_symbol: &str,
> +    arch_specific: &String,
> +    info: &AttributeDef,
> +) -> Vec<Finding> {
> +    let mut findings =3D Vec::new();
> +
> +    if args.is_enabled(Check::DuplicateDependency) {
> +        findings.extend(check_duplicate_dependencies(
> +            arch_specific,
> +            var_symbol,
> +            info,
> +        ));
> +    }
> +
> +    if args.is_enabled(Check::DuplicateImply) {
> +        findings.extend(check_duplicate_implies(arch_specific, var_sym=
bol, info));
> +    }
> +
> +    if args.is_enabled(Check::DuplicateRange) {
> +        findings.extend(check_duplicate_ranges(arch_specific, var_symb=
ol, info));
> +    }
> +
> +    if args.is_enabled(Check::DuplicateSelect) {
> +        findings.extend(check_duplicate_selects(arch_specific, var_sym=
bol, info));
> +    }
> +
> +    if args.is_enabled(Check::ConstantCondition) {
> +        findings.extend(check_constant_conditions(arch_specific, var_s=
ymbol, info));
> +    }
> +
> +    if args.is_enabled(Check::DeadDefault)
> +        || args.is_enabled(Check::DuplicateDefault)
> +        || args.is_enabled(Check::DuplicateDefaultValue)
> +    {
> +        findings.extend(check_defaults(arch_specific, var_symbol, info=
, args));
> +    }
> +
> +    if args.is_enabled(Check::ReverseRange) {
> +        findings.extend(check_reverse_ranges(arch_specific, var_symbol=
, info));
> +    }
> +
> +    findings
> +}
> +
> +// TODO: also check if a config option in one arch unconditionally ref=
erences a config option that only exists in another arch (need SMT for th=
is first)
> +pub fn check_select_visible(var_symbol: &str, info: &TypeInfo) -> Vec<=
Finding> {
> +    let mut findings =3D Vec::new();
> +
> +    // only interested in the options that are selected
> +    if info.selected_by.is_empty() {
> +        return Vec::new();
> +    }
> +
> +    for (selector, select_info) in &info.selected_by {
> +        for (arch, _cond) in select_info {
> +            // NOTE: we don't care if the select is conditional or unc=
onditional, just the selectee's visibility
> +
> +            // at this point, we know that `selector` unconditionally =
selects `var_symbol`
> +            // now, we need to check if `var_symbol` is unconditionall=
y visible
> +
> +            let message =3D format!(
> +                "selects the visible {}; consider using 'depends on' o=
r 'imply' instead",
> +                var_symbol
> +            );
> +
> +            // match the architecture that the select happens under wi=
th the architecture of the unconditional visibility
> +            match info.attribute_defs.get(arch) {
> +                None =3D> {
> +                    // not selected in this architecture
> +                }
> +                Some(cur_arch_attribute_def) =3D> {
> +                    for (if_conditions, attributes) in cur_arch_attrib=
ute_def {
> +                        if if_conditions.is_empty() && attributes.visi=
bility.is_empty() {
> +                            // empty visiblity means that it is uncond=
itionally visible, within the current arch (assuming arch is not `None`)
> +
> +                            findings.push(Finding {
> +                                severity: Severity::Warning,
> +                                check: Check::SelectVisible,
> +                                symbol: Some(selector.to_owned()),
> +                                message: message.clone(),
> +                                arch: arch.to_owned(),
> +                            });
> +                        }
> +                    }
> +                }
> +            }
> +        }
> +    }
> +
> +    findings
> +}
> +
> +fn is_duplicate<T: Eq + std::hash::Hash>(set: &mut HashSet<T>, key: T)=
 -> bool {
> +    !set.insert(key)
> +}
> +
> +fn check_duplicate_dependencies(
> +    arch_specific: &String,
> +    var_symbol: &str,
> +    info: &AttributeDef,
> +) -> Vec<Finding> {
> +    let mut findings =3D Vec::new();
> +    let mut seen =3D HashSet::new();
> +
> +    for dep in &info.kconfig_dependencies {
> +        if is_duplicate(&mut seen, dep.to_string()) {
> +            let message =3D format!("duplicate dependency on {}", dep.=
to_string());
> +            findings.push(Finding {
> +                severity: Severity::Warning,
> +                check: Check::DuplicateDependency,
> +                symbol: Some(var_symbol.to_owned()),
> +                message,
> +                arch: arch_specific.to_owned(),
> +            });
> +        }
> +    }
> +
> +    findings
> +}
> +
> +fn check_duplicate_implies(arch: &String, var_symbol: &str, info: &Att=
ributeDef) -> Vec<Finding> {
> +    let mut findings =3D Vec::new();
> +
> +    // symbols implied unconditionally
> +    let mut unconditional: HashSet<String> =3D HashSet::new();
> +
> +    // (symbol, condition)
> +    let mut conditional: HashSet<(String, String)> =3D HashSet::new();=

> +
> +    for imp in &info.implies {
> +        let imply_var =3D imp.0.clone();
> +
> +        match &imp.1 {
> +            Some(cond) =3D> {
> +                let cond_str =3D cond.to_string();
> +
> +                // duplicate conditional imply
> +                if !conditional.insert((imply_var.clone(), cond_str.cl=
one())) {
> +                    findings.push(Finding {
> +                        severity: Severity::Warning,
> +                        check: Check::DuplicateImply,
> +                        symbol: Some(var_symbol.to_owned()),
> +                        message: format!(
> +                            "duplicate imply of {:?} with condition {}=
",
> +                            imp.0, cond_str
> +                        ),
> +                        arch: arch.to_owned(),
> +                    });
> +                }
> +
> +                // conditional imply is dead if unconditional exists
> +                if unconditional.contains(&imply_var) {
> +                    findings.push(Finding {
> +                        severity: Severity::Warning,
> +                        check: Check::DeadImply,
> +                        symbol: Some(var_symbol.to_owned()),
> +                        message: format!("dead imply of {:?}", imp),
> +                        arch: arch.to_owned(),
> +                    });
> +                }
> +            }
> +
> +            None =3D> {
> +                // duplicate unconditional imply
> +                if !unconditional.insert(imply_var.clone()) {
> +                    findings.push(Finding {
> +                        severity: Severity::Warning,
> +                        check: Check::DuplicateImply,
> +                        symbol: Some(var_symbol.to_owned()),
> +                        message: format!("duplicate imply of {:?}", im=
p),
> +                        arch: arch.to_owned(),
> +                    });
> +                }
> +
> +                // previous conditionals with same symbol are dead
> +                for (sym, _) in &conditional {
> +                    if sym =3D=3D &imply_var {
> +                        findings.push(Finding {
> +                            severity: Severity::Warning,
> +                            check: Check::DeadImply,
> +                            symbol: Some(var_symbol.to_owned()),
> +                            message: format!("dead imply of {:?}", imp=
),
> +                            arch: arch.to_owned(),
> +                        });
> +                    }
> +                }
> +            }
> +        }
> +    }
> +
> +    findings
> +}
> +
> +fn check_duplicate_ranges(arch: &String, var_symbol: &str, info: &Attr=
ibuteDef) -> Vec<Finding> {
> +    let mut findings =3D Vec::new();
> +
> +    // unconditional ranges by bounds
> +    let mut unconditional: HashSet<String> =3D HashSet::new();
> +
> +    // (bounds, condition)
> +    let mut conditional: HashSet<(String, String)> =3D HashSet::new();=

> +
> +    for range in &info.kconfig_ranges {
> +        // uniquely identify the range bounds
> +        let range_key =3D format!("{} {}", range.lower_bound, range.up=
per_bound);
> +
> +        match &range.r#if {
> +            Some(cond) =3D> {
> +                let cond_str =3D cond.to_string();
> +
> +                // duplicate conditional range
> +                if !conditional.insert((range_key.clone(), cond_str.cl=
one())) {
> +                    findings.push(Finding {
> +                        severity: Severity::Warning,
> +                        check: Check::DuplicateRange,
> +                        symbol: Some(var_symbol.to_owned()),
> +                        message: format!("duplicate range {:?} with co=
ndition {}", range, cond_str),
> +                        arch: arch.to_owned(),
> +                    });
> +                }
> +
> +                // conditional range is dead if unconditional exists
> +                if unconditional.contains(&range_key) {
> +                    findings.push(Finding {
> +                        severity: Severity::Warning,
> +                        check: Check::DeadRange,
> +                        symbol: Some(var_symbol.to_owned()),
> +                        message: format!("dead range of {:?}", range),=

> +                        arch: arch.to_owned(),
> +                    });
> +                }
> +            }
> +
> +            None =3D> {
> +                // duplicate unconditional range
> +                if !unconditional.insert(range_key.clone()) {
> +                    findings.push(Finding {
> +                        severity: Severity::Warning,
> +                        check: Check::DeadRange,
> +                        symbol: Some(var_symbol.to_owned()),
> +                        message: format!("duplicate range {:?}", range=
),
> +                        arch: arch.to_owned(),
> +                    });
> +                }
> +
> +                // previous conditionals with same bounds are dead
> +                for (bounds, _) in &conditional {
> +                    if bounds =3D=3D &range_key {
> +                        findings.push(Finding {
> +                            severity: Severity::Warning,
> +                            check: Check::DeadRange,
> +                            symbol: Some(var_symbol.to_owned()),
> +                            message: format!("dead range of {:?}", ran=
ge),
> +                            arch: arch.to_owned(),
> +                        });
> +                    }
> +                }
> +            }
> +        }
> +    }
> +
> +    findings
> +}
> +
> +fn check_duplicate_selects(arch: &String, var_symbol: &str, info: &Att=
ributeDef) -> Vec<Finding> {
> +    let mut findings =3D Vec::new();
> +
> +    // symbols selected unconditionally
> +    let mut unconditional: HashSet<String> =3D HashSet::new();
> +
> +    // (symbol, condition)
> +    let mut conditional: HashSet<(String, String)> =3D HashSet::new();=

> +
> +    for select in &info.selects {
> +        let select_var =3D select.0.clone();
> +
> +        match &select.1 {
> +            Some(cond) =3D> {
> +                let cond_str =3D cond.to_string();
> +
> +                // duplicate conditional select
> +                if !conditional.insert((select_var.clone(), cond_str.c=
lone())) {
> +                    findings.push(Finding {
> +                        severity: Severity::Warning,
> +                        check: Check::DuplicateSelect,
> +                        symbol: Some(var_symbol.to_owned()),
> +                        message: format!(
> +                            "duplicate select of {:?} with condition {=
}",
> +                            select.0, cond_str
> +                        ),
> +                        arch: arch.to_owned(),
> +                    });
> +                }
> +
> +                // conditional is dead if unconditional exists
> +                if unconditional.contains(&select_var) {
> +                    findings.push(Finding {
> +                        severity: Severity::Warning,
> +                        check: Check::DeadSelect,
> +                        symbol: Some(var_symbol.to_owned()),
> +                        message: format!("dead select of {:?}", select=
=2E0),
> +                        arch: arch.to_owned(),
> +                    });
> +                }
> +            }
> +
> +            None =3D> {
> +                // duplicate unconditional select
> +                if !unconditional.insert(select_var.clone()) {
> +                    findings.push(Finding {
> +                        severity: Severity::Warning,
> +                        check: Check::DuplicateSelect,
> +                        symbol: Some(var_symbol.to_owned()),
> +                        message: format!("duplicate select of {:?}", s=
elect.0),
> +                        arch: arch.to_owned(),
> +                    });
> +                }
> +
> +                // any previous conditional selects are now dead too
> +                for (sym, _) in &conditional {
> +                    if sym =3D=3D &select_var {
> +                        findings.push(Finding {
> +                            severity: Severity::Warning,
> +                            check: Check::DeadSelect,
> +                            symbol: Some(var_symbol.to_owned()),
> +                            message: format!("dead select of {:?}", se=
lect.0),
> +                            arch: arch.to_owned(),
> +                        });
> +                    }
> +                }
> +            }
> +        }
> +    }
> +
> +    findings
> +}
> +
> +#[allow(clippy::collapsible_if)]
> +fn check_defaults(
> +    arch: &String,
> +    var_symbol: &str,
> +    info: &AttributeDef,
> +    args: &AnalysisArgs,
> +) -> Vec<Finding> {
> +    let mut findings =3D Vec::new();
> +    let mut seen_conditions =3D HashSet::new();
> +    let mut seen_values =3D HashSet::new();
> +    let mut already_unconditional =3D false;
> +
> +    for default in &info.kconfig_defaults {
> +        let val_str =3D default.expression.to_string();
> +
> +        let has_real_condition =3D match &default.r#if {
> +            Some(cond) =3D> {
> +                let cond_str =3D cond.to_string();
> +                !cond_str.is_empty()
> +            }
> +            None =3D> false,
> +        };
> +
> +        let is_value_dup =3D if has_real_condition {
> +            is_duplicate(&mut seen_values, val_str.clone())
> +        } else {
> +            false
> +        };
> +
> +        if already_unconditional && args.is_enabled(Check::DeadDefault=
) {
> +            findings.push(Finding {
> +                severity: Severity::Warning,
> +                check: Check::DeadDefault,
> +                symbol: Some(var_symbol.to_owned()),
> +                message: format!("dead default of {}", val_str),
> +                arch: arch.to_owned(),
> +            });
> +        }
> +
> +        if args.is_enabled(Check::DuplicateDefaultValue) {
> +            if default.r#if.is_some() && is_value_dup {
> +                findings.push(Finding {
> +                    severity: Severity::Style,
> +                    check: Check::DuplicateDefaultValue,
> +                    symbol: Some(var_symbol.to_owned()),
> +                    message: format!(
> +                        "duplicate default value of {}; consider combi=
ning the conditions with a logical-or: ||",
> +                        val_str
> +                    ),
> +                    arch: arch.to_owned(),
> +                });
> +            }
> +        }
> +
> +        match &default.r#if {
> +            Some(cond) =3D> {
> +                if is_duplicate(&mut seen_conditions, cond.to_string()=
) {
> +                    if is_value_dup {
> +                        if args.is_enabled(Check::DuplicateDefault) {
> +                            findings.push(Finding {
> +                                severity: Severity::Warning,
> +                                check: Check::DuplicateDefault,
> +                                symbol: Some(var_symbol.to_owned()),
> +                                message: format!("duplicate default co=
ndition of {:?}", cond),
> +                                arch: arch.to_owned(),
> +                            });
> +                        }
> +                    } else {
> +                        if args.is_enabled(Check::DeadDefault) {
> +                            findings.push(Finding {
> +                                severity: Severity::Warning,
> +                                check: Check::DeadDefault,
> +                                symbol: Some(var_symbol.to_owned()),
> +                                message: format!("dead default of {}",=
 val_str),
> +                                arch: arch.to_owned(),
> +                            });
> +                        }
> +                    }
> +                }
> +            }
> +            None =3D> {
> +                already_unconditional =3D true;
> +            }
> +        }
> +    }
> +
> +    findings
> +}
> diff --git a/scripts/kconfirm/kconfirm-lib/src/curl_ffi.rs b/scripts/kc=
onfirm/kconfirm-lib/src/curl_ffi.rs
> new file mode 100644
> index 000000000000..d458010cc3f1
> --- /dev/null
> +++ b/scripts/kconfirm/kconfirm-lib/src/curl_ffi.rs
> @@ -0,0 +1,182 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +use core::ffi::c_void;
> +use std::ffi::CStr;
> +use std::ffi::CString;
> +use std::os::raw::c_char;
> +use std::os::raw::c_int;
> +use std::os::raw::c_long;
> +use std::sync::OnceLock;
> +
> +static CURL_INIT: OnceLock<()> =3D OnceLock::new();
> +
> +#[repr(C)]
> +pub struct CURL {
> +    _private: [u8; 0],
> +}
> +
> +type CURLcode =3D c_int;
> +type CURLoption =3D u32;
> +type CURLINFO =3D u32;
> +
> +const CURLE_OK: CURLcode =3D 0;
> +
> +const CURL_GLOBAL_DEFAULT: c_long =3D 3;
> +
> +const CURLOPT_URL: CURLoption =3D 10002;
> +const CURLOPT_NOBODY: CURLoption =3D 44;
> +const CURLOPT_TIMEOUT: CURLoption =3D 13;
> +const CURLOPT_FOLLOWLOCATION: CURLoption =3D 52;
> +const CURLOPT_USERAGENT: CURLoption =3D 10018;
> +const CURLOPT_HEADERFUNCTION: CURLoption =3D 20079;
> +const CURLOPT_HEADERDATA: CURLoption =3D 10029;
> +
> +const CURLINFO_RESPONSE_CODE: CURLINFO =3D 0x200002;
> +
> +#[link(name =3D "curl")]
> +unsafe extern "C" {}
> +
> +unsafe extern "C" {
> +    fn curl_global_init(flags: c_long) -> CURLcode;
> +
> +    fn curl_easy_init() -> *mut CURL;
> +
> +    fn curl_easy_cleanup(handle: *mut CURL);
> +
> +    fn curl_easy_perform(handle: *mut CURL) -> CURLcode;
> +
> +    fn curl_easy_strerror(code: CURLcode) -> *const c_char;
> +
> +    fn curl_easy_setopt(handle: *mut CURL, option: CURLoption, ...) ->=
 CURLcode;
> +
> +    fn curl_easy_getinfo(handle: *mut CURL, info: CURLINFO, ...) -> CU=
RLcode;
> +}
> +
> +fn init_curl() {
> +    CURL_INIT.get_or_init(|| unsafe {
> +        curl_global_init(CURL_GLOBAL_DEFAULT);
> +    });
> +}
> +
> +fn curl_error(code: CURLcode) -> String {
> +    unsafe {
> +        let ptr =3D curl_easy_strerror(code);
> +
> +        if ptr.is_null() {
> +            return format!("curl error {}", code);
> +        }
> +
> +        CStr::from_ptr(ptr).to_string_lossy().into_owned()
> +    }
> +}
> +
> +struct HeaderCapture {
> +    location: Option<String>,
> +}
> +
> +extern "C" fn header_callback(
> +    buffer: *mut c_char,
> +    size: usize,
> +    nitems: usize,
> +    userdata: *mut c_void,
> +) -> usize {
> +    let total =3D size * nitems;
> +
> +    unsafe {
> +        let bytes =3D std::slice::from_raw_parts(buffer as *const u8, =
total);
> +
> +        if let Ok(header) =3D std::str::from_utf8(bytes) {
> +            let lower =3D header.to_ascii_lowercase();
> +
> +            if lower.starts_with("location:") {
> +                if let Some((_, value)) =3D header.split_once(':') {
> +                    let capture =3D &mut *(userdata as *mut HeaderCapt=
ure);
> +
> +                    capture.location =3D Some(value.trim().to_string()=
);
> +                }
> +            }
> +        }
> +    }
> +
> +    total
> +}
> +
> +#[derive(Debug)]
> +pub struct HttpResponse {
> +    pub response_code: u16,
> +    pub location: Option<String>,
> +}
> +
> +pub fn head_request(url: &str) -> Result<HttpResponse, String> {
> +    init_curl();
> +
> +    unsafe {
> +        let curl =3D curl_easy_init();
> +
> +        if curl.is_null() {
> +            return Err("curl_easy_init failed".into());
> +        }
> +
> +        let url_c =3D match CString::new(url) {
> +            Ok(v) =3D> v,
> +            Err(_) =3D> {
> +                curl_easy_cleanup(curl);
> +
> +                return Err("invalid URL".into());
> +            }
> +        };
> +
> +        let ua_c =3D CString::new("link-checker/1.0").unwrap();
> +
> +        let mut headers =3D HeaderCapture { location: None };
> +
> +        macro_rules! setopt {
> +            ($opt:expr, $val:expr) =3D> {{
> +                let rc =3D curl_easy_setopt(curl, $opt, $val);
> +
> +                if rc !=3D CURLE_OK {
> +                    curl_easy_cleanup(curl);
> +
> +                    return Err(curl_error(rc));
> +                }
> +            }};
> +        }
> +
> +        setopt!(CURLOPT_URL, url_c.as_ptr());
> +        setopt!(CURLOPT_NOBODY, 1 as c_long);
> +        setopt!(CURLOPT_TIMEOUT, 10 as c_long);
> +        setopt!(CURLOPT_FOLLOWLOCATION, 0 as c_long);
> +        setopt!(CURLOPT_USERAGENT, ua_c.as_ptr());
> +
> +        setopt!(
> +            CURLOPT_HEADERFUNCTION,
> +            header_callback as extern "C" fn(_, _, _, _) -> _
> +        );
> +
> +        setopt!(CURLOPT_HEADERDATA, &mut headers as *mut _ as *mut c_v=
oid);
> +
> +        let rc =3D curl_easy_perform(curl);
> +
> +        if rc !=3D CURLE_OK {
> +            curl_easy_cleanup(curl);
> +
> +            return Err(curl_error(rc));
> +        }
> +
> +        let mut response_code: c_long =3D 0;
> +
> +        let rc =3D curl_easy_getinfo(curl, CURLINFO_RESPONSE_CODE, &mu=
t response_code);
> +
> +        if rc !=3D CURLE_OK {
> +            curl_easy_cleanup(curl);
> +
> +            return Err(curl_error(rc));
> +        }
> +
> +        curl_easy_cleanup(curl);
> +
> +        Ok(HttpResponse {
> +            response_code: response_code as u16,
> +            location: headers.location,
> +        })
> +    }
> +}
> diff --git a/scripts/kconfirm/kconfirm-lib/src/dead_links.rs b/scripts/=
kconfirm/kconfirm-lib/src/dead_links.rs
> new file mode 100644
> index 000000000000..47bbd5c09114
> --- /dev/null
> +++ b/scripts/kconfirm/kconfirm-lib/src/dead_links.rs
> @@ -0,0 +1,138 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +use crate::curl_ffi::head_request;
> +use std::collections::HashSet;
> +
> +#[derive(PartialEq, Debug)]
> +pub enum LinkStatus {
> +    Ok,
> +    ProbablyBlocked,
> +    Redirected(String),
> +    NotFound,
> +    ServerError,
> +    Unreachable(String),
> +    UnsupportedScheme(String),
> +}
> +
> +pub fn check_link(url: &str) -> LinkStatus {
> +    if let Some(scheme) =3D url.split("://").next() {
> +        match scheme {
> +            "http" | "https" =3D> return check_http(url),
> +
> +            "git" | "ftp" =3D> {
> +                return LinkStatus::UnsupportedScheme(scheme.into());
> +            }
> +
> +            _ =3D> {
> +                return LinkStatus::UnsupportedScheme(scheme.into());
> +            }
> +        }
> +    }
> +
> +    LinkStatus::Unreachable("invalid URL".into())
> +}
> +
> +fn check_http(url: &str) -> LinkStatus {
> +    let response =3D match head_request(url) {
> +        Ok(r) =3D> r,
> +        Err(e) =3D> return LinkStatus::Unreachable(e),
> +    };
> +
> +    match response.response_code {
> +        200..=3D299 =3D> LinkStatus::Ok,
> +
> +        301 | 302 =3D> LinkStatus::Redirected(response.location.unwrap=
_or_else(|| "unknown".into())),
> +
> +        403 | 429 =3D> LinkStatus::ProbablyBlocked,
> +
> +        404 =3D> LinkStatus::NotFound,
> +
> +        500..=3D599 =3D> LinkStatus::ServerError,
> +
> +        _ =3D> LinkStatus::ProbablyBlocked,
> +    }
> +}
> +
> +pub fn find_links(text: &str) -> Vec<String> {
> +    fn is_scheme_char(c: u8) -> bool {
> +        c.is_ascii_alphanumeric() || matches!(c, b'+' | b'-' | b'.')
> +    }
> +
> +    fn is_url_terminator(c: u8) -> bool {
> +        c.is_ascii_whitespace()
> +            || matches!(
> +                c,
> +                b'"' | b'\'' | b'<' | b'>' | b'(' | b')' | b'[' | b']'=
 | b'{' | b'}'
> +            )
> +    }
> +
> +    let bytes =3D text.as_bytes();
> +
> +    let mut links =3D Vec::new();
> +    let mut seen =3D HashSet::new();
> +
> +    let mut i =3D 0;
> +
> +    while i + 3 < bytes.len() {
> +        if bytes[i] =3D=3D b':' && bytes[i + 1] =3D=3D b'/' && bytes[i=
 + 2] =3D=3D b'/' {
> +            // walk backward to find scheme start
> +            let mut start =3D i;
> +
> +            while start > 0 && is_scheme_char(bytes[start - 1]) {
> +                start -=3D 1;
> +            }
> +
> +            // require non-empty scheme
> +            if start =3D=3D i {
> +                i +=3D 3;
> +                continue;
> +            }
> +
> +            // first char must be alphabetic
> +            if !bytes[start].is_ascii_alphabetic() {
> +                i +=3D 3;
> +                continue;
> +            }
> +
> +            // walk forward to url end
> +            let mut end =3D i + 3;
> +
> +            while end < bytes.len() && !is_url_terminator(bytes[end]) =
{
> +                end +=3D 1;
> +            }
> +
> +            let mut url =3D &text[start..end];
> +
> +            // trim trailing punctuation
> +            url =3D url.trim_end_matches(&['.', ',', ';', ':', '!', '?=
'][..]);
> +
> +            // trim unmatched markdown
> +            while let Some(last) =3D url.chars().last() {
> +                let trim =3D match last {
> +                    ')' =3D> url.matches('(').count() < url.matches(')=
').count(),
> +
> +                    ']' =3D> url.matches('[').count() < url.matches(']=
').count(),
> +
> +                    '}' =3D> url.matches('{').count() < url.matches('}=
').count(),
> +
> +                    _ =3D> false,
> +                };
> +
> +                if trim {
> +                    url =3D &url[..url.len() - last.len_utf8()];
> +                } else {
> +                    break;
> +                }
> +            }
> +
> +            if seen.insert(url) {
> +                links.push(url.to_string());
> +            }
> +
> +            i =3D end;
> +        } else {
> +            i +=3D 1;
> +        }
> +    }
> +
> +    links
> +}
> diff --git a/scripts/kconfirm/kconfirm-lib/src/lib.rs b/scripts/kconfir=
m/kconfirm-lib/src/lib.rs
> new file mode 100644
> index 000000000000..6be0199f0785
> --- /dev/null
> +++ b/scripts/kconfirm/kconfirm-lib/src/lib.rs
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +use analyze::analyze;
> +pub use checks::AnalysisArgs;
> +pub use checks::Check;
> +pub use checks::check_select_visible;
> +pub use checks::check_variable_info;
> +use nom_kconfig::Entry;
> +use nom_kconfig::KconfigInput;
> +use nom_kconfig::parse_kconfig;
> +use output::*;
> +use symbol_table::*;
> +mod analyze;
> +mod checks;
> +mod curl_ffi;
> +mod dead_links;
> +pub mod output;
> +pub mod symbol_table;
> +
> +pub fn check_kconfig(
> +    args: AnalysisArgs,
> +    kconfig_files: Vec<(String, KconfigInput)>,
> +) -> Vec<Finding> {
> +    let mut findings =3D Vec::new();
> +    let mut symbol_table =3D SymbolTable::new();
> +
> +    for (arch_config_option, kconfig_file) in kconfig_files {
> +        match parse_kconfig(kconfig_file) {
> +            Ok(parsed) =3D> {
> +                let entries: Vec<Entry> =3D parsed.1.entries;
> +                findings.extend(analyze(
> +                    &args,
> +                    &mut symbol_table,
> +                    arch_config_option,
> +                    entries,
> +                ));
> +            }
> +            Err(e) =3D> {
> +                findings.push(Finding {
> +                    severity: Severity::Fatal,
> +                    check: Check::FailedParse,
> +                    symbol: None,
> +                    message: format!("Failed to parse kconfig, error i=
s: {}", e),
> +                    arch: arch_config_option,
> +                });
> +            }
> +        }
> +    }
> +
> +    for (var_symbol, type_info) in &symbol_table.raw {
> +        for (arch_specific, redefinitions) in &type_info.attribute_def=
s {
> +            for (_definition_condition, info) in redefinitions {
> +                findings.extend(check_variable_info(&args, var_symbol,=
 arch_specific, info));
> +            }
> +        }
> +
> +        if args.is_enabled(Check::SelectVisible) {
> +            findings.extend(check_select_visible(var_symbol, type_info=
));
> +        }
> +    }
> +
> +    findings
> +}
> diff --git a/scripts/kconfirm/kconfirm-lib/src/output.rs b/scripts/kcon=
firm/kconfirm-lib/src/output.rs
> new file mode 100644
> index 000000000000..e0d8bf8342d5
> --- /dev/null
> +++ b/scripts/kconfirm/kconfirm-lib/src/output.rs
> @@ -0,0 +1,111 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +use crate::Check;
> +use std::fmt;
> +
> +#[derive(Debug, PartialEq, Eq, PartialOrd, Ord)]
> +pub enum Severity {
> +    Fatal,
> +    Error, // will be used for known bugs, e.g. unmet dependencies
> +    Warning,
> +    Style,
> +}
> +
> +#[derive(Debug)]
> +pub struct Finding {
> +    pub severity: Severity,
> +    pub check: Check,
> +    pub symbol: Option<String>,
> +    pub message: String,
> +    pub arch: String,
> +}
> +
> +impl Finding {
> +    fn fmt_with_arches(&self, f: &mut fmt::Formatter, arches: &[&str])=
 -> fmt::Result {
> +        let arch_part =3D if arches.is_empty() {
> +            String::new()
> +        } else {
> +            format!(" [{}]", arches.join(", "))
> +        };
> +
> +        match &self.symbol {
> +            Some(s) =3D> write!(
> +                f,
> +                "{} [{}]{} config {}: {}",
> +                self.severity,
> +                self.check.as_str(),
> +                arch_part,
> +                s,
> +                self.message
> +            ),
> +            None =3D> write!(
> +                f,
> +                "{} [{}]{} {}",
> +                self.severity,
> +                self.check.as_str(),
> +                arch_part,
> +                self.message
> +            ),
> +        }
> +    }
> +}
> +
> +impl fmt::Display for Finding {
> +    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
> +        self.fmt_with_arches(f, &[])
> +    }
> +}
> +
> +pub fn print_findings(mut findings: Vec<Finding>) {
> +    findings.sort_by(|a, b| {
> +        (
> +            &a.severity,
> +            a.check.as_str(),
> +            &a.symbol,
> +            &a.message,
> +            &a.arch,
> +        )
> +            .cmp(&(
> +                &b.severity,
> +                b.check.as_str(),
> +                &b.symbol,
> +                &b.message,
> +                &b.arch,
> +            ))
> +    });
> +
> +    for group in findings.chunk_by(|a, b| {
> +        a.severity =3D=3D b.severity
> +            && a.check.as_str() =3D=3D b.check.as_str()
> +            && a.symbol =3D=3D b.symbol
> +            && a.message =3D=3D b.message
> +    }) {
> +        let head =3D &group[0];
> +
> +        let mut arches: Vec<&str> =3D Vec::new();
> +        for f in group {
> +            if arches.last() !=3D Some(&f.arch.as_str()) {
> +                arches.push(&f.arch);
> +            }
> +        }
> +
> +        // Use a small wrapper so we can call our custom formatter via=
 println!
> +        struct Wrap<'a>(&'a Finding, &'a [&'a str]);
> +        impl fmt::Display for Wrap<'_> {
> +            fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
> +                self.0.fmt_with_arches(f, self.1)
> +            }
> +        }
> +        println!("{}", Wrap(head, &arches));
> +    }
> +}
> +
> +impl fmt::Display for Severity {
> +    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
> +        match self {
> +            Severity::Fatal =3D> write!(f, "FATAL  "),
> +            Severity::Error =3D> write!(f, "ERROR  "),
> +            Severity::Warning =3D> write!(f, "WARNING"),
> +            Severity::Style =3D> write!(f, "STYLE   "),
> +        }
> +    }
> +}
> diff --git a/scripts/kconfirm/kconfirm-lib/src/symbol_table.rs b/script=
s/kconfirm/kconfirm-lib/src/symbol_table.rs
> new file mode 100644
> index 000000000000..48abb46c1945
> --- /dev/null
> +++ b/scripts/kconfirm/kconfirm-lib/src/symbol_table.rs
> @@ -0,0 +1,223 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +use nom_kconfig::attribute::DefaultAttribute;
> +use nom_kconfig::attribute::Expression;
> +use nom_kconfig::attribute::OrExpression;
> +use nom_kconfig::attribute::Range;
> +use nom_kconfig::attribute::r#type::Type;
> +use std::collections::HashMap;
> +use std::collections::hash_map;
> +
> +type KconfigSymbol =3D String;
> +type Arch =3D String;
> +type Cond =3D Option<Expression>;
> +
> +// NOTE: we cannot add these elements to the solver until we've proces=
sed all variables,
> +// because we need to know all of the selectors.
> +#[derive(Debug, Clone)]
> +pub struct TypeInfo {
> +    pub kconfig_type: Option<Type>, // 'None' when we don't know the t=
ype (e.g. if it's a dangling reference)
> +
> +    // maps the selector to an (ARCH, select_cond)
> +    // - if the ARCH is None, then it's not arch-specific
> +    // if the select_cond is None, then it's unconditional
> +    pub selected_by: HashMap<KconfigSymbol, Vec<(Arch, Cond)>>, // .0 =
only selects it when .1 is true.
> +
> +    // there is one of these per entry (each entry expected to have a =
different definedness condition)
> +    // maps architecture option name (or none if not arch-specific) to=
:
> +    // [([condition], config definition)]
> +    // - NOTE: there can be multiple partial definitions under the sam=
e condition, or mutually-exclusive conditions, or a subset condition.
> +    pub attribute_defs: HashMap<Arch, Vec<(Vec<Expression>, AttributeD=
ef)>>, // the innermost `Vec<Expression>` represents each nested conditio=
n that was reached (we will eventually need to AND them all)
> +}
> +
> +// everything is a vector because we may encounter multiple over time,=

> +//   so we won't know until the end what the condition is.
> +#[derive(Debug, Clone)]
> +pub struct AttributeDef {
> +    pub kconfig_dependencies: Vec<OrExpression>,
> +    pub kconfig_ranges: Vec<Range>,
> +    pub kconfig_defaults: Vec<DefaultAttribute>,
> +    pub visibility: Vec<Option<OrExpression>>,
> +    pub selects: Vec<(KconfigSymbol, Cond)>,
> +    pub implies: Vec<(KconfigSymbol, Cond)>,
> +}
> +
> +impl TypeInfo {
> +    fn new_empty() -> Self {
> +        Self {
> +            kconfig_type: None,
> +            selected_by: HashMap::new(),
> +            attribute_defs: HashMap::new(),
> +        }
> +    }
> +
> +    // TODO: we should consider having separate functions for:
> +    // 1. merge-inserting a redef of attributes (NOTE: the type defini=
tion is actually part of the redef, but we aren't handling type-redefinit=
ions for now)
> +    // 2. selectors
> +    fn insert(
> +        &mut self,
> +        kconfig_type: Option<Type>,
> +        raw_constraints: Vec<OrExpression>,
> +        kconfig_ranges: Vec<Range>,
> +        kconfig_defaults: Vec<DefaultAttribute>,
> +        visibility: Vec<Option<OrExpression>>,
> +        arch: String,
> +        definition_condition: Vec<OrExpression>,
> +        selected_by: Option<(KconfigSymbol, Cond)>,
> +        selects: Vec<(KconfigSymbol, Cond)>,
> +        implies: Vec<(KconfigSymbol, Cond)>,
> +    ) {
> +        // type merge
> +        match (&self.kconfig_type, &kconfig_type) {
> +            (None, Some(_)) =3D> self.kconfig_type =3D kconfig_type.cl=
one(),
> +            (Some(_), Some(new)) if Some(new) !=3D self.kconfig_type.a=
s_ref() =3D> {
> +                // TODO: not doing anything with redefined types yet.
> +                //       later, we will want to consider e.g. bool/def=
_bool the same type (and possibly int/hex?) but not bool/tristate, so we =
need to build out typechecking.
> +            }
> +            _ =3D> {}
> +        }
> +
> +        // selected_by merge
> +        if let Some(sb) =3D selected_by {
> +            merge_selected_by(&mut self.selected_by, arch.clone(), sb)=
;
> +        }
> +
> +        // variable_info merge:
> +        //   we only want to add an attribute redefinition if the thin=
gs in the attribute def aren't empty
> +        //   (the visibility is just additional info to capture)
> +        if (&kconfig_type).is_some() // we need to ensure that we have=
 an empty definition here if the config option had a type definition
> +            || !raw_constraints.is_empty()
> +            || !kconfig_ranges.is_empty()
> +            || !kconfig_defaults.is_empty()
> +            || !selects.is_empty()
> +            || !implies.is_empty()
> +        {
> +            insert_variable_info(
> +                &mut self.attribute_defs,
> +                arch,
> +                definition_condition,
> +                AttributeDef {
> +                    kconfig_dependencies: raw_constraints,
> +                    kconfig_ranges,
> +                    kconfig_defaults,
> +                    visibility,
> +                    selects,
> +                    implies,
> +                },
> +            );
> +        }
> +    }
> +}
> +
> +// the visibility and the dependencies will each need to be AND'd (sep=
arately)
> +// the defaults should each be handled separately.
> +pub struct ChoiceData {
> +    //pub inner_vars: Vec<String>,
> +    pub arch: Arch,
> +    pub visibility: Cond,
> +    pub dependencies: Vec<OrExpression>, // this is the menu's depende=
ncies (and inherited dependencies from the file)
> +    pub defaults: Vec<DefaultAttribute>, // these are each of the cond=
itional defaults for the choice
> +}
> +
> +// NOTE: it might be better if TypeInfo is an enum with a single value=
,
> +//       e.g. Unsolved(kconfig_raw) and Solved(z3_ast)
> +pub struct SymbolTable {
> +    pub raw: HashMap<KconfigSymbol, TypeInfo>,
> +    pub choices: Vec<ChoiceData>,
> +    pub modules_option: Option<KconfigSymbol>, // None until we find t=
he modules attribute in exactly 1 config option
> +}
> +
> +impl SymbolTable {
> +    pub fn new() -> Self {
> +        SymbolTable {
> +            raw: HashMap::new(),
> +            choices: Vec::new(),
> +            modules_option: None,
> +        }
> +    }
> +
> +    pub fn from_parts(
> +        raw: HashMap<KconfigSymbol, TypeInfo>,
> +        choices: Vec<ChoiceData>,
> +        modules_option: Option<KconfigSymbol>,
> +    ) -> Self {
> +        SymbolTable {
> +            raw,
> +            choices,
> +            modules_option,
> +        }
> +    }
> +
> +    pub fn merge_insert_new_solved(
> +        &mut self,
> +        var: KconfigSymbol,
> +        kconfig_type: Option<Type>,
> +        raw_constraints: Vec<OrExpression>,
> +        kconfig_ranges: Vec<Range>,
> +        kconfig_defaults: Vec<DefaultAttribute>,
> +        visibility: Vec<Option<OrExpression>>,
> +        arch: Arch,
> +        definition_condition: Vec<OrExpression>,
> +        selected_by: Option<(KconfigSymbol, Cond)>,
> +        selects: Vec<(KconfigSymbol, Cond)>,
> +        implies: Vec<(KconfigSymbol, Cond)>,
> +    ) {
> +        let entry =3D self.raw.entry(var.clone());
> +
> +        match entry {
> +            hash_map::Entry::Vacant(v) =3D> {
> +                let mut t =3D TypeInfo::new_empty();
> +                t.insert(
> +                    kconfig_type,
> +                    raw_constraints,
> +                    kconfig_ranges,
> +                    kconfig_defaults,
> +                    visibility,
> +                    arch,
> +                    definition_condition,
> +                    selected_by,
> +                    selects,
> +                    implies,
> +                );
> +                v.insert(t);
> +            }
> +
> +            hash_map::Entry::Occupied(mut o) =3D> {
> +                let t =3D o.get_mut();
> +
> +                t.insert(
> +                    kconfig_type,
> +                    raw_constraints,
> +                    kconfig_ranges,
> +                    kconfig_defaults,
> +                    visibility,
> +                    arch,
> +                    definition_condition,
> +                    selected_by,
> +                    selects,
> +                    implies,
> +                );
> +            }
> +        }
> +    }
> +}
> +
> +fn merge_selected_by(
> +    map: &mut HashMap<String, Vec<(Arch, Cond)>>,
> +    arch: Arch,
> +    selected_by: (KconfigSymbol, Cond),
> +) {
> +    map.entry(selected_by.0)
> +        .or_default() // empty vec
> +        .push((arch, selected_by.1));
> +}
> +
> +fn insert_variable_info(
> +    map: &mut HashMap<Arch, Vec<(Vec<Expression>, AttributeDef)>>,
> +    arch: Arch,
> +    definition_condition: Vec<Expression>,
> +    info: AttributeDef,
> +) {
> +    map.entry(arch)
> +        .or_default() // empty vec
> +        .push((definition_condition, info));
> +}
> diff --git a/scripts/kconfirm/kconfirm-linux/Cargo.toml b/scripts/kconf=
irm/kconfirm-linux/Cargo.toml
> new file mode 100644
> index 000000000000..9516399e1dae
> --- /dev/null
> +++ b/scripts/kconfirm/kconfirm-linux/Cargo.toml
> @@ -0,0 +1,10 @@
> +# SPDX-License-Identifier: GPL-2.0
> +[package]
> +name =3D "kconfirm-linux"
> +version =3D "0.10.0"
> +edition =3D "2024"
> +rust-version.workspace =3D true
> +
> +[dependencies]
> +kconfirm-lib =3D { path =3D "../kconfirm-lib" }
> +nom-kconfig =3D { workspace =3D true }
> diff --git a/scripts/kconfirm/kconfirm-linux/src/getopt_ffi.rs b/script=
s/kconfirm/kconfirm-linux/src/getopt_ffi.rs
> new file mode 100644
> index 000000000000..227faa17b962
> --- /dev/null
> +++ b/scripts/kconfirm/kconfirm-linux/src/getopt_ffi.rs
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +use std::env;
> +use std::ffi::CStr;
> +use std::ffi::CString;
> +use std::os::raw::c_char;
> +use std::os::raw::c_int;
> +use std::ptr;
> +
> +pub const REQUIRED_ARGUMENT: c_int =3D 1;
> +
> +#[repr(C)]
> +pub struct option {
> +    pub name: *const c_char,
> +    pub has_arg: c_int,
> +    pub flag: *mut c_int,
> +    pub val: c_int,
> +}
> +
> +#[link(name =3D "c")]
> +unsafe extern "C" {
> +    fn getopt_long(
> +        argc: c_int,
> +        argv: *mut *mut c_char,
> +        optstring: *const c_char,
> +        longopts: *const option,
> +        longindex: *mut c_int,
> +    ) -> c_int;
> +
> +    static mut optarg: *mut c_char;
> +    static mut optind: c_int;
> +}
> +
> +pub struct Getopt {
> +    _cstrings: Vec<CString>,
> +    argv: Vec<*mut c_char>,
> +    argc: c_int,
> +}
> +
> +impl Getopt {
> +    pub fn new() -> Self {
> +        let raw_args: Vec<String> =3D env::args().collect();
> +
> +        let cstrings: Vec<CString> =3D raw_args
> +            .iter()
> +            .map(|s| CString::new(s.as_str()).unwrap())
> +            .collect();

This panics if the arguments aren't valid UTF-8.  Using env::args_os()
might be better.  getopt_long() doesn't care if the arguments are
valid UTF-8 or not.

> +        let mut argv: Vec<*mut c_char> =3D
> +            cstrings.iter().map(|s| s.as_ptr() as *mut c_char).collect=
();
> +
> +        argv.push(ptr::null_mut());
> +
> +        let argc =3D (argv.len() - 1) as c_int;
> +
> +        Self {
> +            _cstrings: cstrings,
> +            argv,
> +            argc,
> +        }
> +    }
> +
> +    pub fn reset(&mut self) {
> +        unsafe {
> +            optind =3D 1;
> +        }
> +    }
> +
> +    pub fn next(
> +        &mut self,
> +        optstring: &CStr,
> +        longopts: &[option],
> +    ) -> Option<Result<(char, Option<String>), String>> {
> +        unsafe {
> +            let c =3D getopt_long(
> +                self.argc,
> +                self.argv.as_mut_ptr(),
> +                optstring.as_ptr(),
> +                longopts.as_ptr(),
> +                ptr::null_mut(),
> +            );
> +
> +            if c =3D=3D -1 {
> +                return None;
> +            }
> +
> +            if c =3D=3D '?' as c_int {

            if c =3D=3D c_int::from(b'?') {

Might be a bit clearer.

> +                return Some(Err("invalid argument".into()));

You can just std::process::exit() here.  getopt_long() will have
printed an error message.  This assumes that the=20

> +            }
> +
> +            let arg =3D if optarg.is_null() {
> +                None
> +            } else {
> +                Some(CStr::from_ptr(optarg).to_string_lossy().into_own=
ed())
> +            };

I'd prefer to return an OsString here.
> +            Some(Ok((c as u8 as char, arg)))
> +        }
> +    }
> +}

I think it is simpler to just inline all of this code into its
single call-site.  The safety of the code is obvious in context,
and you can avoid checking for impossible errors.  For instance,
since all of the options have required arguments, it really is safe
to dereference optarg without any null check.

Yes, this is C with Rust syntax, but it's *simple* C with Rust syntax.

As an aside, I don't know if you want to accept abbreviated long
options.  Most tools using getopt_long() allow them.  If you don't,
I can show you how to reject them.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
--------------jhmGQRobVkA6ZWilxmc78Uz0
Content-Type: application/pgp-keys; name="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBFp+A0oBEADffj6anl9/BHhUSxGTICeVl2tob7hPDdhHNgPR4C8xlYt5q49y
B+l2nipdaq+4Gk6FZfqC825TKl7eRpUjMriwle4r3R0ydSIGcy4M6eb0IcxmuPYf
bWpr/si88QKgyGSVZ7GeNW1UnzTdhYHuFlk8dBSmB1fzhEYEk0RcJqg4AKoq6/3/
UorR+FaSuVwT7rqzGrTlscnTDlPWgRzrQ3jssesI7sZLm82E3pJSgaUoCdCOlL7M
MPCJwI8JpPlBedRpe9tfVyfu3euTPLPxwcV3L/cfWPGSL4PofBtB8NUU6QwYiQ9H
zx4xOyn67zW73/G0Q2vPPRst8LBDqlxLjbtx/WLR6h3nBc3eyuZ+q62HS1pJ5EvU
T1vjyJ1ySrqtUXWQ4XlZyoEFUfpJxJoN0A9HCxmHGVckzTRl5FMWo8TCniHynNXs
BtDQbabt7aNEOaAJdE7to0AH3T/Bvwzcp0ZJtBk0EM6YeMLtotUut7h2Bkg1b//r
6bTBswMBXVJ5H44Qf0+eKeUg7whSC9qpYOzzrm7+0r9F5u3qF8ZTx55TJc2g656C
9a1P1MYVysLvkLvS4H+crmxA/i08Tc1h+x9RRvqba4lSzZ6/Tmt60DPM5Sc4R0nS
m9BBff0Nm0bSNRS8InXdO1Aq3362QKX2NOwcL5YaStwODNyZUqF7izjK4QARAQAB
zTxEZW1pIE9iZW5vdXIgKElUTCBFbWFpbCBLZXkpIDxhdGhlbmFAaW52aXNpYmxl
dGhpbmdzbGFiLmNvbT7CwY4EEwEIADgWIQR2h02fEza6IlkHHHGyiLVf/5wiwQUC
X6YJvQIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRCyiLVf/5wiwWRhD/0Y
R+YYC5Kduv/2LBgQJIygMsFiRHbR4+tWXuTFqgrxxFSlMktZ6gQrQCWe38WnOXkB
oY6n/5lSJdfnuGd2UagZ/9dkaGMUkqt+5WshLFly4BnP7pSsWReKgMP7etRTwn3S
zk1OwFx2lzY1EnnconPLfPBc6rWG2moA6l0WX+3WNR1B1ndqpl2hPSjT2jUCBWDV
rGOUSX7r5f1WgtBeNYnEXPBCUUM51pFGESmfHIXQrqFDA7nBNiIVFDJTmQzuEqIy
Jl67pKNgooij5mKzRhFKHfjLRAH4mmWZlB9UjDStAfFBAoDFHwd1HL5VQCNQdqEc
/9lZDApqWuCPadZN+pGouqLysesIYsNxUhJ7dtWOWHl0vs7/3qkWmWun/2uOJMQh
ra2u8nA9g91FbOobWqjrDd6x3ZJoGQf4zLqjmn/P514gb697788e573WN/MpQ5XI
Fl7aM2d6/GJiq6LC9T2gSUW4rbPBiqOCeiUx7Kd/sVm41p9TOA7fEG4bYddCfDsN
xaQJH6VRK3NOuBUGeL+iQEVF5Xs6Yp+U+jwvv2M5Lel3EqAYo5xXTx4ls0xaxDCu
fudcAh8CMMqx3fguSb7Mi31WlnZpk0fDuWQVNKyDP7lYpwc4nCCGNKCj622ZSocH
AcQmX28L8pJdLYacv9pU3jPy4fHcQYvmTavTqowGnM08RGVtaSBNYXJpZSBPYmVu
b3VyIChsb3ZlciBvZiBjb2RpbmcpIDxkZW1pb2Jlbm91ckBnbWFpbC5jb20+wsF4
BBMBAgAiBQJafgNKAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRCyiLVf
/5wiwYa/EACv8a2+MMou9cSCNoZBQaU+fTmyzft9hUE+0d5W2UY1RY3OsjFIzm9R
/4SVccfsqOYLEo+S0vQMIIIqFEq3FCpXXwPzyimotps05VA8U3Bd7yseojFygOgK
sAMOAee2RCaDDOnoJue01dfZMzzHPO/TVdp3OvnpWipfv5G1Xg96rwbhMLE3tg6N
xwAHa31Bv4/Xq8CJOoIWvx6fcmZQpz01/lSvsYn0KrfEbTKkuUf0vM9JrCTCP2oz
VNN5BYzqaq2M4r+jmSyeXLim922VOWqGkUEQ85BSEemqrRS06IU6NtEMsF8EWt/b
hWjk/9GDKTcnpdJHTrMxTspExBiNrvpI2t+YPU5B/dJJAUxvmhFrbSIbdB8umBZs
I3AMYrEmpAbh5x7jEjoskUC7uN3o9vpg1oCLS2ePDLtAtyBtbHnkA4xGD7ar8mem
xpH9lY/i+sC6CyyIUWcUDnnagKyJP0m9ks0GLsTeOCA0bft2XA6rD6aaCnMUsndT
ctrab42CV5XypjmC4U1rPJ8JQJUh1/3P48/8sMH+3krxpJ06KNWNFaUbaMTGiltZ
7x9DngklSYrX0T+2G4kVXNmjaljwkoLahwLla2gUWwBSyofXdqyhQdwZsp01KXNQ
UCyT/Pg+aDcm/E7OMV3d4lf7g/CSxiX2GSEe6BlhSz+Lmd7ZJ3g32M1ARGVtaSBN
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
EtJuZYM5blWncBOJCoWMnBEcTEo/viU3GgcVRw=3D=3D
=3Dx94R
-----END PGP PUBLIC KEY BLOCK-----

--------------jhmGQRobVkA6ZWilxmc78Uz0--

--------------TqV93QP1ulPRmspZYpcTeGjR--

--------------XrfVtVa1LPouWVhsakWdKgBS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmoJW8YACgkQszaHOrMp
8lOn0A/+Jijc1MiMMr/PrlQ3zhJhnPOLCB9GLAVIzuL9ZHB8hG7+rUB+18Qyom5U
0vmp39Y4zq+n0qo1IbHUIkeTsqjPTvK3IdZKGShsdt/DFb15ptd9n/62n1lDu6YD
WHqU+X74JRfezRAMSxDtu9H51UKtVb+z7xvzBbsJEBgc4XSxrX4XwcOQX2ERGqUT
HEs4PJFUU+ciHj+FngMbqxI87y4cvxAQNqmFM3FBGa1ypdL0ymwFTIt4EmV8FQJp
IXrz5pDalHR3NPegCazvXtk680uC2Wa4HdIqldPDwKCk9x7LNdwBjfJRLuPqmiA6
Z68lcQpVCznNuAfy2Gh1BHqlDEKpA8sGyMZPDi8HcnSDI2AM3/NQRwewllflouLA
NCuQSqhmpn1J9A0A7DJYr5PSV6P23Z5nufwozkXYKx0NcDu8afoFiFMWLYfDH2AT
j3VPZE8SG9gE8abIQHLLTU2WBR7zVNA/oIbM9BKWtmtrXs45TPf971/m7SsivuFG
V7fI3BDk/L2JszUDiFq7C0vV3pO/y6A1o3qHVhlrrrksLyfXfnIf8qTv2RqFN3GN
ODfEJE6DeJB+FzBFsbdiEJo8zrO5anU3MRlxGXZ869agkYFGt3soxG6PzrJmRQp+
OOltZadvhTT6NhJoNQNHpKMeClGbqcQ3TjkZFRz0bgh8sBpiep8=
=LL+k
-----END PGP SIGNATURE-----

--------------XrfVtVa1LPouWVhsakWdKgBS--

