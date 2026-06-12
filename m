Return-Path: <linux-kbuild+bounces-13742-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fHZ0DmsaLGreLQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13742-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 16:40:43 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C767B67A463
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 16:40:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b="tR/Ev165";
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13742-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13742-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 539E83148C64
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 14:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D87F3033F8;
	Fri, 12 Jun 2026 14:39:13 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCDE35E93C
	for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2026 14:39:12 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781275153; cv=pass; b=mKWdqNiOZMS63IOIGij0LP0+zJkMInWIXRaozh52lEJpzkSlvISYRO+NOkZ1/xV0VCgbSukokBGPMSz1fNpEM8ryV0jYZfJJ36n1QOYE2qZkRMfYz1prwC30R2QL9JIH0f386005FcEi11IZCgvde/PesYOkS8M7ZoEiGtsOy0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781275153; c=relaxed/simple;
	bh=ouj7/XxF+rM/cqEOn/Xx8H8wm6495TcijVSF+fy6VoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bPxy2ASTzPSMMiqH/8EJqugsFqMaFi/lf+4sL7XoLxo7ulLJNfJKbgFaLoB8fERKUOrBYObn3nE3Ts5NTaae3stGjvpfGO1n9YJnRGKvNlnBdIBNiUWiqeiUkS9Z6HL/cjioZdNL+vcnE33BSs/aG130pGvqoRFJ7aCbVfXdDko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tR/Ev165; arc=pass smtp.client-ip=209.85.214.169
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bf2911f93cso83845ad.1
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2026 07:39:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781275152; cv=none;
        d=google.com; s=arc-20240605;
        b=UbgWfPUDVE71yoQrQJ/Akgts+RxUppg6eurva+RYtcExuIZIW06MPRfNo+95ro9cFn
         whYsyOElcEKmou/iJRBPrSEPvfaZ6btx4ST8bC2Wfi84GAzltx7v23O9MRwKILpzn54F
         2FHCkS+Bw1UaIwSTiLfsXDJMVA4UmWPq6zi/Ta93q+0YoEqsQFlcHxG3+Lc6dOGqLtee
         9zb8JIKGypwpPATOlHnMLMRc+8W0ZdJ8fi2BqyFkRlFGArg7qYabvBsH0zxfnek71GJK
         nKzBQ7DnFky2DUBbBUbasrYgrtgH/ZeQGir1nluoXT/hyVicK7UUQAypeUppmo5wExzB
         kVcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pPD0U5NZ4eXf//hJDc4itwhE90Vj8iebVbR8OA3Plrs=;
        fh=BGTG2wOp+kCdUriFRYe58mAs2FHQ/L5DgAOuhUk5oFs=;
        b=kxoTENd3L9b+bkD4gg6PDfXIlM4Kgiper3PnfbTsklYTHQPLoL+/8ZLNLOYaeMFVa1
         aoKHLewz+ETlIN1Q1e2O/J71hoZlNGZ5O8rvxUr+Dz99WZ5JzgUeGzADXxlewg5DzFWj
         XP9hOsmkh82H9X/t7p38dEcWKIVFdN6at3oqfUGOLY5ou6t01yD1kC9sAHpDZYUwRjUZ
         //+YuKRJcp3vNVX8vk176xonqd89leSsAzMFisj2hhmyjy+w1K9eBkPlpMuzWD+AWURC
         XDbNTwgpDLKdKpg1jjtMah6UpSmEvyC2JlV/qz3e1+bRjMLrKWYix40Go8Jcii0cZyrv
         LVWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781275152; x=1781879952; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPD0U5NZ4eXf//hJDc4itwhE90Vj8iebVbR8OA3Plrs=;
        b=tR/Ev165JhC48vvb/HKrpwxPMFfu1RP1N3p/dZ+LT6er0sOqiiJdJtp+7AxAPZQ2+0
         YuMyOcQ6V/LPbZitmO4wukRQbATcWNepSyQGgeMCCL2mGfz40Z9wdfgL34Okov4mRyT3
         k2r6cNf5xUTVJIVCH2ZRVFm+1TOI6ylWPzfHpCYGcI98/mpBym/gsPWjKRU9/y/y4AAm
         KDeFsvr0kdMsgdlZ/bQOTwxErAAy7SKNP9GbGtcEqDP7pGXCxnXOne+yWGTNIWyoxjXA
         O0e0Q79I4k6DzOmmi6Av0cku9XEeQyGtatBbYgKe1hMbjD7kqlKPVi/eHfNJ3ymICUAQ
         V8jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781275152; x=1781879952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pPD0U5NZ4eXf//hJDc4itwhE90Vj8iebVbR8OA3Plrs=;
        b=X3wDOeCUW00kmfavW2HBMRK/qZF/Y8ZpjOjbRfAqsB/KPNSdreyw23Gcer2YbZc84L
         l1AabGjhB0sTfMz8eyauLph+nkHTzaium6sdv6RTcjd5F/5wcgiWQhIXSotekIAEwEtj
         i2lAIn2xQ0gQQnTLln3Msw3EJyDuzh7+8dzRwvSc27zwzkoYRA9hnqgjfiF1Mdqk33zp
         wllLVdIzds14qGzsBsHYEnIXan7ow1M4z4kfOnseliAD5eI5tyKmjzy6Nq4DZn/WZ3Fp
         Z9ZETROdffWIOrYSr60+IEvRu1d5XhjcDE9HIeU4v0wsXsxy+W1vbH54wx/Jc7n8hGcH
         9mqw==
X-Forwarded-Encrypted: i=1; AFNElJ89eglUchwptttbhE2aNVcEb8Sutqx/bNSmHAVepoWMrbVJviOpxrsBabCbeKAQ3uXGjoOc9J3v1lU/P0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzQD2wnQ7iAw7t8KfgQkC9xWe15rJevHcyJgoHNeQ8MZnqjgHb
	s3BU9GamHVslArD4EzTzG1qHcb1MKqyjxAzoQoiFX+zTQAO2BO/uWvaoElTsgWI8Qye4pKPkguV
	skeaPFmGftmyuTofXEbQydv9B6+9PsTLfWy9mZ+12
X-Gm-Gg: Acq92OEerAbpssE7fNCdXNqBRMJLE91FOFcsMdlKhWPL+V0GIfa5IgNCEVse/1e6Ruv
	1Htii19Jh/u4KTfopcQKwf7ySc8Ubxr8k81k78ahyZcNLV4Q3/uaT2+Nf8FllxYu4446MrMVwWU
	zylXhFOrL2CTOIKdCObjkHf/Oh199tpygZwzKREL0La0/n7RdEOU/5F8vXLyJz7k8MKaL3fSdGe
	HGiPfidW+d4QinegSc1oM4HDCyHBl8nwawYza+3a0hInhbuZ7pVndxQJ2Lh6gpPlEZC/LOeILJ+
	/ecDY9qFGmjG99VKXGBZsor/TQRVD6HcUuxEBLvT
X-Received: by 2002:a17:903:238b:b0:2c1:4a67:5f31 with SMTP id
 d9443c01a7336-2c405c8b703mr1596605ad.9.1781275151261; Fri, 12 Jun 2026
 07:39:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612133139.1919042-1-petr.pavlu@suse.com>
In-Reply-To: <20260612133139.1919042-1-petr.pavlu@suse.com>
From: Peter Collingbourne <pcc@google.com>
Date: Fri, 12 Jun 2026 07:38:58 -0700
X-Gm-Features: AVVi8Cc9-HjgSxhb69tvudsXLdOhYLKLMYT9ddnMNb-ycz4VaCGBguQJI8Ay6yk
Message-ID: <CAMn1gO79nDnUXuTR6LJ61kGJ8zH5gvV5st5-OjjqxD4cOxds0A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Use --force-group-allocation when linking modules
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>, linux-kbuild@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:petr.pavlu@suse.com,m:nathan@kernel.org,m:nsc@kernel.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:samitolvanen@google.com,m:da.gomez@kernel.org,m:mcgrof@kernel.org,m:atomlin@atomlin.com,m:linux-kbuild@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-modules@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[pcc@google.com,linux-kbuild@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13742-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pcc@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C767B67A463

On Fri, Jun 12, 2026 at 6:31=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> Specific code, such as outlined KASAN checks, may be placed in
> COMDAT-deduplicated sections. When linking modules as relocatable files,
> the linker by default preserves such groups, potentially leaving multiple
> copies in the resulting modules and unnecessary group metadata.
>
> Use --force-group-allocation to have the linker resolve the COMDAT groups
> and place their members as regular sections. The option is available from
> ld.bfd 2.29 and ld.lld 19.1.0.
>
> Remove the workaround in arch/arm64/include/asm/module.lds.h that was add=
ed
> for the same problem but limited to CONFIG_KASAN_SW_TAGS and .text.hot.
> Note that this code currently has no effect anyway because all .text.hot
> sections are placed in the .text output section by scripts/module.lds.S,
> since commit 1ba9f8979426 ("vmlinux.lds: Unify TEXT_MAIN, DATA_MAIN, and
> related macros").
>
> Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>

Reviewed-by: Peter Collingbourne <pcc@google.com>

> ---
>  Makefile                            |  6 ++++++
>  arch/arm64/include/asm/module.lds.h | 13 -------------
>  2 files changed, 6 insertions(+), 13 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index e156e2696efe..1729af0690b3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1189,6 +1189,12 @@ KBUILD_RUSTFLAGS +=3D $(KRUSTFLAGS)
>  KBUILD_LDFLAGS_MODULE +=3D --build-id=3Dsha1
>  LDFLAGS_vmlinux +=3D --build-id=3Dsha1
>
> +# Specific code, such as outlined KASAN checks, may be placed in
> +# COMDAT-deduplicated sections. Use --force-group-allocation to resolve =
these
> +# groups when linking modules. The option is available from ld.bfd 2.29 =
and
> +# ld.lld 19.1.0.
> +KBUILD_LDFLAGS_MODULE +=3D $(call ld-option,--force-group-allocation)
> +
>  KBUILD_LDFLAGS +=3D -z noexecstack
>  ifeq ($(CONFIG_LD_IS_BFD),y)
>  KBUILD_LDFLAGS +=3D $(call ld-option,--no-warn-rwx-segments)
> diff --git a/arch/arm64/include/asm/module.lds.h b/arch/arm64/include/asm=
/module.lds.h
> index fb944b46846d..792a0820757a 100644
> --- a/arch/arm64/include/asm/module.lds.h
> +++ b/arch/arm64/include/asm/module.lds.h
> @@ -4,19 +4,6 @@ SECTIONS {
>         .text.ftrace_trampoline 0 : { BYTE(0) }
>         .init.text.ftrace_trampoline 0 : { BYTE(0) }
>
> -#ifdef CONFIG_KASAN_SW_TAGS
> -       /*
> -        * Outlined checks go into comdat-deduplicated sections named .te=
xt.hot.
> -        * Because they are in comdats they are not combined by the linke=
r and
> -        * we otherwise end up with multiple sections with the same .text=
.hot
> -        * name in the .ko file. The kernel module loader warns if it see=
s
> -        * multiple sections with the same name so we use this sections
> -        * directive to force them into a single section and silence the
> -        * warning.
> -        */
> -       .text.hot : { *(.text.hot) }
> -#endif
> -
>  #ifdef CONFIG_UNWIND_TABLES
>         /*
>          * Currently, we only use unwind info at module load time, so we =
can
>
> base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
> --
> 2.54.0
>

