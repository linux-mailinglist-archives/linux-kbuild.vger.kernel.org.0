Return-Path: <linux-kbuild+bounces-11613-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMYgJSqoqmmzVAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11613-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Mar 2026 11:10:50 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B87321E7C2
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Mar 2026 11:10:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3E9B302A2F5
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Mar 2026 10:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019DD35C1AC;
	Fri,  6 Mar 2026 10:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APs3Pd/Y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFC0359A97
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Mar 2026 10:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772791669; cv=pass; b=ZCX3l22CpiAwevmfxj/wB0Zov53Mr6yegRn+AGLBEXSGHdnCynfNFruPzOhj8JVhoaOxoeHHFRNhVPg/J5LfqtGFBYlJsU1aGvhn5Wg7zVUsnGcmh8fMyRpZa1y477tTke0Di03+Cwg/J33wXGJ+Xv8gPPH8Lq0mGaGPCbW3OH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772791669; c=relaxed/simple;
	bh=FpWh862gEku98kCLig3c46uSdzxamRSgEzhbqtKtTvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kCv1R7tTMebUW97I7J3TVJI+rnYoO1aUJaLBGJpcb2ICa+9zBfRJRqPWYcxYkGRi8e/H5JCxWrYh5FtmlIr8rd9bEvmjofAyjwIsMOySnfTZGEBy842amoy178LHWgtYMu/atucYQZ9yCwfNppWzT1tKJleXctZ99zR6az2weCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APs3Pd/Y; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-128bae6a35aso121982c88.1
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Mar 2026 02:07:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772791667; cv=none;
        d=google.com; s=arc-20240605;
        b=XnvPh+dursypiIRrOu+bOzIKvzfZVCMlW82CQDt1sWONartHQMGDbjSZwgpBPHjY1p
         EDs/iRcYd1yE2/OWYE85X+PncKIKynB/fyg1o8+qZlTF0865tSV1CY++wokTfQAADOTM
         VgfTZh8vl3mPR5GHGOUGKgObpxnLRuCtgyO6PevMbHxt102bsHg/WRBvgubEfgz0cai7
         UqIv7VjPi6Qt5tawrRFsp2MVoQ/6hpf5ltn7mD1YUX3oLzK3GYhcDjbkYMh5u8QtI48g
         +HnZSmYbDwV5/tUpFqEIJca8YUOOucPrGOvwj7FoTj+yMTwsxLcJR0ACadWzVUJo/61b
         yxzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bMWTs4qndO1zee7/ID+Vcc2GRKot4BShkBFBU3cRJAc=;
        fh=NG2vQICdzy22dSYKnX9ljt7ZgfDSt5eEiHMKdZef8z4=;
        b=SAY6H410MdGN/GtQUBR9OUYki740fsWOsfizOM5p/HMO+4U5G3ilTFdJU5msDmSS8w
         oGyVS7TvWKYI2heiEqaA8FOxlO0wbiPS8jQuUiiJhpClCsJXw85XSDanvEv73Oxwmlh/
         1TUPut4YaM5Gf78IMMEL8qFlGrzMKFyrmLw4F1Qplwn6mCDrvHt3PDKEDigOm5ojwbJH
         dscTalyzxK7AsshLDpjVkcktiDWyMYUeSwIXOmaAlHRUnKexqVcubvsW5W69jkQQBPmQ
         Hd2bnyq+4RHT0OPIUa5YoeYPuuOGm0Jg46rDbjwAeTAi2t0fRss/QebeNXox809KnD0N
         WgxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772791667; x=1773396467; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMWTs4qndO1zee7/ID+Vcc2GRKot4BShkBFBU3cRJAc=;
        b=APs3Pd/Yk2qIARVTbwX3gq4Vn2tbe8F1F4uCQFDwqdgT7gg73y6/6yDGEy/t6MW7Fz
         I41rTugc1y1ZRJi+8vTdSEj5YXWX0g0ps5v7LTcVz0lpgZf4beicsmozcJ6yEvmwxy9N
         LZHdYSpV3CLUUnlkeTMR9RZui+5mzuscN54qrZWmY+puoOi4dxaEViGl7v6J73CKqXm1
         EO+ohYRuqMKG0pItUSg/KPDCvt2ZCifTq1jXQtUCh+mrbhMrtl7PqZ91u6WPlBovwid2
         uFC9XzEI2RiSNbtIeko9ZSXmwzRVoKnPW27pz3iyCHeISv8Y9ilcD47jy+/mVRuxtavx
         B4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772791667; x=1773396467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bMWTs4qndO1zee7/ID+Vcc2GRKot4BShkBFBU3cRJAc=;
        b=P+mhHitcgOsgZki1MYGNm+iVm7e8ubam6LO04TCw4IDPG1e5DGv4j0iY+D1Syv5BgL
         p4XkXp6WqV1MPfarbTrXDB/Livhb4XOk1+NEmE0sbZtilMrDfhxehG74MFuRTgVMbNc4
         tOQKqieZXOpSk2HAUXdlPemP1DE6mBnAFBxmgFDk/AZSgHCRArxo+f115mFy7Nh67VdZ
         160gBgvr8zdDyKMG3kn/GJLkADabCjsVQ3aK5fYRFH3o5P6aSc21HlbXwQDYdwCSUNaF
         urf24PxPhdqpOyiLeKDTKptppiWFhhxuEMrRb5wHcMngFb75ZYxMVYaYIH+3Le2QJY53
         NYNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzZiB8l23YOH7ZvZoG/YA4CnSh0MR1/+2DKgwdSN7L6QUJlmYTGdBPqocqOlquAB8wPIogra9+QJozvxI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTFqpx+BwxuIZTos8zRf2TAizuIDilXj4sLEQtntAPNwkZxnGp
	iuteF9co1ev3cN4p7NgZBsGCcdp9k6Du8lcseip+m+leEFOvevJPfJbyb6WcF6iwvHk2budAk6b
	SbywotmUeFPoyDr9C3zzzoA7dehFfIKw=
X-Gm-Gg: ATEYQzzj5ALaMXGrdGOuOfqsBLOFHt85J7QEjtWSdU/9QoZVGpq/SBqy86gFuifk5qA
	rVfIRNIir+Y9OcPYAzpMd8O+7DBplie8N0jsMBKpeQfjC0j/kKXecVX/mvosxFKpgDJCdd8tGLO
	EpjeI+t4KmwljpS/1VUjtT4e6dFssMz8GFWdv0VbpIPxHxQ8tIfACWuU/+G1QMuITTg77ZQk4kE
	RbyWg72x6OGfHwBgGbBROqLLbxJ08LWnPRQAefbxZyVX7H7Y60hxrYZxVTP3cV8ipItVQFCCfiy
	DcJVZVjne2mmYIjRH2eokHjyN9QGopjreph4SRCTMqGSGvO8Rvdd8yIzHSa8gWxzJeJ0u8X6BW4
	lMLhJAkqjPsAPMoBqnNLZaow3
X-Received: by 2002:a05:7300:cd90:b0:2be:1544:5c34 with SMTP id
 5a478bee46e88-2be4e09a273mr256769eec.8.1772791667261; Fri, 06 Mar 2026
 02:07:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226152112.3222886-1-gary@kernel.org>
In-Reply-To: <20260226152112.3222886-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 6 Mar 2026 11:07:33 +0100
X-Gm-Features: AaiRm50zvPItKVKfhOfvASJU43xsYV_zn_llnCUBdfgj1_h5pAFqNBKGxo2J0yQ
Message-ID: <CANiq72nu=HNnMiT4HEFi3Tk+zFy9tZ66biy8QXC01qk7wLg0KA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: build: remap path to avoid absolute path
To: Gary Guo <gary@garyguo.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Janne Grunau <j@jannau.net>, Asahi Lina <lina+kernel@asahilina.net>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 1B87321E7C2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11613-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,google.com,umich.edu,weissschuh.net,jannau.net,asahilina.net,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,kernel];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 4:21=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> When building with a out directory (O=3D), absolute paths can end up in t=
he
> file name in `#[track_caller]` or the panic message. This is not desirabl=
e
> as this leaks the exact path being used to build the kernel and means tha=
t
> the same location can appear in two forms (relative or absolute).
>
> This is reported by Asahi [1] and is being workaround in [2] previously t=
o
> force everything to be absolute path. Using absolute path for everything
> sovles the inconsistency, however it does not address the reproducibility
> issue. So, fix this by remap all absolute paths to srctree to relative pa=
th
> instead.
>
> This is previously attemped in commit dbdffaf50ff9 ("kbuild, rust: use
> -fremap-path-prefix to make paths relative") but that was reverted as
> remapping debug info causes some tool (e.g. objdump) to be unable to find
> sources. Therefore, use `--remap-path-scope` to only remap macros but lea=
ve
> debuginfo untouched. `--remap-path-scope` is only stable in Rust 1.95, so
> use `rustc-option` to detect its presence. This feature has been availabl=
e
> as  `-Zremap-path-scope` for all versions that we support; hwoever due to
> bugs in the Rust compiler, it does not work reliably until 1.94. I opted =
to
> not enable it for 1.94 as it's just a single version that we missed.
>
> This change can be validated by building a kernel with O=3D, strip debug =
info
> on vmlinux, and then check if the absolute path exists in `strings
> vmlinux`, e.g. `strings vmlinux |grep \/home`.
>
> Reported-by: Janne Grunau <j@jannau.net>
> Reported-by: Asahi Lina <lina+kernel@asahilina.net>
> Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-Gener=
al/topic/Per-call-site.20data.20and.20lock.20class.20keys/near/572466559 [1=
]
> Link: https://github.com/AsahiLinux/linux/commit/54ab88878869036c9d662010=
1bfe17a81e88c2f9 [2]
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-fixes` -- thanks everyone!

    [ Reworded for few typos. - Miguel ]

Cheers,
Miguel

