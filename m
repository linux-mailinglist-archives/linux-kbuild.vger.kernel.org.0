Return-Path: <linux-kbuild+bounces-10761-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4D0uLOIocGmyWwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10761-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 02:16:18 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 459344EF0D
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 02:16:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3BFB88C70B4
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 01:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C0F929D297;
	Wed, 21 Jan 2026 01:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbL/rA7v"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612952DB795
	for <linux-kbuild@vger.kernel.org>; Wed, 21 Jan 2026 01:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768958171; cv=none; b=EPugE5T9Ze/hjryVkj+MEhOJXxfnoEJ1F2xRm4X5ufHeDLKovbOOQnX0Jfk4LpA+xm/9jOIE4o49JhiU+MoaG07U83+UzpCv212OTV/YglSU+o+liymmnekGQOJq3HftYhAOr0+4XjXogUju8Bj+vkmrnbhpu7fgAfXY3CxLEls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768958171; c=relaxed/simple;
	bh=8tK93kNbfRfdSjL6W5C/lx7kmJbOTp0ynbmaT+UmxLU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=bqlTtRAjk2vr8SlydC5YLmq4ff7t2HPLlIzadRoRZfT8iKruv2F4meC0Y/bYYbea5rKEBStw8VHZAdMP+6YNPC/DI1aopycXhQm5S0J/YjrB5rn5o4YS71mLuZ3+OuaSCTVRlF5CiUPl9MM7KLDn6bC2Dd8w96yh5KEnf8E/KME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bbL/rA7v; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-81ecbdfdcebso3583328b3a.1
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 17:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768958169; x=1769562969; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TuJvjah/Tw/b3alV1e6g6NeIK8xwKHZbZfdxMeTcSjs=;
        b=bbL/rA7vKnUK60t458F+k9TNmrrwQRp8FNJf1paJmgyO7pQcG9Tf2qL0FwNlIhhj/M
         wmtYltkWPyFHUdsyCKbqd5h08PvbVZgVW6ePP6x4NVHWViPuxHkqzTm0gxh8OfPs6vQJ
         CoiqOT7sQXm04poUyru2FrS/ScaUYPl+3wTfGnhHIBqQFxlhYv9aatxwTWh67PAtLBHJ
         Y9PzxZWzEPOv5SuVLi91d7OvHTAc4sWuYMTDIvQDFiArd1iN344BmRJ13zI5QeVzP2Ye
         O/cu6PKyRykf8hSOPQiv/f+f6ecEViOeILdgFEa3vHKTQteqaqUX5o8vxRrXy0Fzf9bH
         RLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768958169; x=1769562969;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TuJvjah/Tw/b3alV1e6g6NeIK8xwKHZbZfdxMeTcSjs=;
        b=bctz/W1Q/pEOqVQjY7ZC8Vc01NfNgXSgeWMWZNDbSAEX1A6peSkd1+tspz28nhDH3Z
         4Mpkh4ZJgIzSqjEAfY2/vu2mtNQlE9CnyP9LLlxowb+alem5549UjJDk+1d2Qo+0aBOe
         4Dvfxj/rylppC4e4u0xaFzmRr8CUlmp3iE91Yw9t2eGpgMcnteJ/h03Xu2n7VyUKedoP
         5vwS9GUs4zHq1gNtnL4f3HQFT4hhivln29qV53ah4PoluzwNV6GU3H0O67ZgFUTPwss8
         4JPGx9vfVrNfykL/cQ3a+ViCuJALVt94teDDbQ8leeZwZfUOiyfQMq1qimC36IlWkbtY
         Dk+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVuBntPLgoXkTwExrHDVc2vw/GO7HN7SX6daXmQdm8YN9BXre+os+goeJlllNHlArRRtxjiQIM6+C6Mdi8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuA7Re26dI6kgYCHbZM5UVs5n01SN/XKx+W0dKCWghtHpfsjde
	7VQJLKULbb9cf0C7srog4x2NoWCw+VWJJFZcmObculH2zMFhOTIiNo7N
X-Gm-Gg: AZuq6aIMcCi/1ZehX9aCQ3DAv/ivCvhJzVHU2yrhCJccwtavfewjpwCYTEPp7jK5Kgr
	fFMuzP5BCnHDMGIeIwYhpgmz9gkOSu4SsfKJFhlaKGPglilSaXb9LYhAJWy1R9yfkG94TqnYBXk
	IgemFqLfU9ydy7gfaxYiLO8QFN0q/I0O0/gMBEDxuCKWtXP3kZpWXdo4DhWX4UR59VFdlGJyyV6
	cgpMuPPIjVThPOYyVlfsdKMn0vD3UbCIANdX0qbDXPZjOolvdTmgCqrOrliDJbont6j6p2Lcqyx
	KLzjlbwQTtSwgOiOGtIP2vJR5/8U8ftmahMlMRYUUsEs6qpRB9sOLu9/X5pEfynmZsTT0fAb/eh
	dSnPbvZQOG7VXRNVIuJaK5KjluQGDL7BO1OEn+euBOBB2Wq64YiP5/YVBSRFUgRkMfjiehtzYei
	I2RqMscW6pCKbAPJDw
X-Received: by 2002:a05:6a00:1413:b0:81d:8d00:76d2 with SMTP id d2e1a72fcca58-81fa18204a0mr12463838b3a.40.1768958168312;
        Tue, 20 Jan 2026 17:16:08 -0800 (PST)
Received: from localhost ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa108c4dbsm13363443b3a.5.2026.01.20.17.16.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 17:16:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 10:16:03 +0900
Message-Id: <DFTVC1IH8KM0.VR14LX627BWD@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 "Linux Kbuild mailing list" <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] scripts: generate_rust_analyzer.py: reduce cfg
 plumbing
From: "Jesung Yang" <y.j3ms.n@gmail.com>
To: "Tamir Duberstein" <tamird@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Jesung Yang" <y.j3ms.n@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260120-rust-analyzer-pin-init-duplication-v2-0-a1c76f0d3bef@kernel.org> <20260120-rust-analyzer-pin-init-duplication-v2-2-a1c76f0d3bef@kernel.org>
In-Reply-To: <20260120-rust-analyzer-pin-init-duplication-v2-2-a1c76f0d3bef@kernel.org>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10761-lists,linux-kbuild=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yj3msn@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 459344EF0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Jan 21, 2026 at 1:10 AM KST, Tamir Duberstein wrote:
> Centralize `cfg` lookup in `append_crate` to avoid having to do so for
> each crate. Remove hardcoded `cfg`s for `pin-init{,-internal}` now that
> these are passed from `rust/Makefile`.
>
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> ---
>  scripts/generate_rust_analyzer.py | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index 147d0cc94068..b96d3cbe3df1 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -35,7 +35,9 @@ def generate_crates(srctree, objtree, sysroot_src, exte=
rnal_src, cfgs, core_edit
>      crates_indexes =3D {}
>      crates_cfgs =3D args_crates_cfgs(cfgs)
> =20
> -    def append_crate(display_name, root_module, deps, cfg=3D[], is_works=
pace_member=3DTrue, is_proc_macro=3DFalse, edition=3D"2021"):
> +    def append_crate(display_name, root_module, deps, cfg=3DNone, is_wor=
kspace_member=3DTrue, is_proc_macro=3DFalse, edition=3D"2021"):
> +        if cfg is None:
> +            cfg =3D crates_cfgs.get(display_name, [])

Could we add a brief comment explaining how the behavior of
`append_crate` changes according to the `cfg` parameter? Since `None`
and an empty list have different effects, documenting that distinction
would make the intended behavior clearer.

This would also help later when we add proper Python docstrings.

Thanks!

Best regards,
Jesung

>          crate =3D {
>              "display_name": display_name,
>              "root_module": str(root_module),
> @@ -60,7 +62,7 @@ def generate_crates(srctree, objtree, sysroot_src, exte=
rnal_src, cfgs, core_edit
>      def append_sysroot_crate(
>          display_name,
>          deps,
> -        cfg=3D[],
> +        cfg=3DNone,
>          edition=3D"2021",
>      ):
>          append_crate(
> @@ -75,7 +77,7 @@ def generate_crates(srctree, objtree, sysroot_src, exte=
rnal_src, cfgs, core_edit
>      # NB: sysroot crates reexport items from one another so setting up o=
ur transitive dependencies
>      # here is important for ensuring that rust-analyzer can resolve symb=
ols. The sources of truth
>      # for this dependency graph are `(sysroot_src / crate / "Cargo.toml"=
 for crate in crates)`.
> -    append_sysroot_crate("core", [], cfg=3Dcrates_cfgs.get("core", []), =
edition=3Dcore_edition)
> +    append_sysroot_crate("core", [], edition=3Dcore_edition)
>      append_sysroot_crate("alloc", ["core"])
>      append_sysroot_crate("std", ["alloc", "core"])
>      append_sysroot_crate("proc_macro", ["core", "std"])
> @@ -90,21 +92,18 @@ def generate_crates(srctree, objtree, sysroot_src, ex=
ternal_src, cfgs, core_edit
>          "proc_macro2",
>          srctree / "rust" / "proc-macro2" / "lib.rs",
>          ["core", "alloc", "std", "proc_macro"],
> -        cfg=3Dcrates_cfgs["proc_macro2"],
>      )
> =20
>      append_crate(
>          "quote",
>          srctree / "rust" / "quote" / "lib.rs",
>          ["alloc", "proc_macro", "proc_macro2"],
> -        cfg=3Dcrates_cfgs["quote"],
>      )
> =20
>      append_crate(
>          "syn",
>          srctree / "rust" / "syn" / "lib.rs",
>          ["proc_macro", "proc_macro2", "quote"],
> -        cfg=3Dcrates_cfgs["syn"],
>      )
> =20
>      append_crate(
> @@ -124,7 +123,6 @@ def generate_crates(srctree, objtree, sysroot_src, ex=
ternal_src, cfgs, core_edit
>          "pin_init_internal",
>          srctree / "rust" / "pin-init" / "internal" / "src" / "lib.rs",
>          [],
> -        cfg=3D["kernel"],
>          is_proc_macro=3DTrue,
>      )
> =20
> @@ -132,7 +130,6 @@ def generate_crates(srctree, objtree, sysroot_src, ex=
ternal_src, cfgs, core_edit
>          "pin_init",
>          srctree / "rust" / "pin-init" / "src" / "lib.rs",
>          ["core", "pin_init_internal", "macros"],
> -        cfg=3D["kernel"],
>      )
> =20
>      append_crate(


