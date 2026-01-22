Return-Path: <linux-kbuild+bounces-10790-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFizNTO9cWkmLwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10790-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 07:01:23 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF6C621FF
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 07:01:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6FFBF4FF42F
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 06:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06B4134EEE2;
	Thu, 22 Jan 2026 06:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKGwMKd2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549A447A0DC
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 06:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769061633; cv=pass; b=eBteBjpYhm4pw68JQZBjq68y4TEJ6T9OEiECeITU1lJLOQhqlkjdeCiHAKQIcHkSdcgc2GABkkGfFEu1od+nMS3467UE71JmYr9KoD/dPmNUvB8INoxEzHFLe+Y0lXlsM5NO+HCZhAWjp+EEEu+2t3RzW9t3/aQQ0LhUjVVlL08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769061633; c=relaxed/simple;
	bh=DHoR9alA2d1tmRmD4CMpwfmcdVkHKyEwN4RnJi0lRYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PeUnaxtGsPGskxyq+5bpSz3v5caNUtyl+fSCTPdyDrAp5EnGs5TnvZJJ20r9DzGRLmE41vZfZznyVHDBpTPOD+u1xwIiQYqjiXkY3s1dL7BwHpMrDoqCG6dqVsIWpC4xiBM4IW7J4LWDGxqdkbwdQzoIUUytCmVweW0qqpI97PA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MKGwMKd2; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b703e04984so46182eec.3
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Jan 2026 22:00:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769061631; cv=none;
        d=google.com; s=arc-20240605;
        b=i6k3keMPhaQosQMU/uSwTJra1WVhv3oSDAc9xThLP7lEswgo6osgkIlBB3wn41mJUR
         l2a5s0ZBrEhQQfBCioBim3BytiQkzmIHdAtmMOB5RYk/JHeld2gYzxHjHR61DHUnHwYz
         0C8EP1/0itvn1zJP1pxJIN/4GfvguAI4L5WcfN2sl5SQG2MtA1IXrCPWckiW6RGgY8Qj
         5p3cf4HGKlIQwqOeOtH7KjkwiBZJBXA1HdrMd5wAPaKYiBIPXJNXWrP2W8YEaRV+Of8W
         DF31Ibyr1/Ng3hZSfpddIzDYExcUyCGVBJyP9JL5xq0rwrsIIBl+jFgudPemJ+BIx75A
         srWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iVdaKC8FZmRo8NG738WVpj60/DWB9v8M21xxR61tSTg=;
        fh=8ja/HWI3HeDSNoFp+LyHPMlw+UFmBLmxjWSwIcCtatE=;
        b=Kn56F8rr9J3048PFANp2deWP7LE04Ei2Of96/OQhsl5EptsYUJpg430vUNc75rW50L
         gyIfP7M4yMu1yzzJgNr75eSgGq5LGMXhZTPKQI/q3MKA/e3qpD4aumEMYPomjAuNCVyC
         wj2MoRd2wKZHPAi41x3X5SaSsMWXrPcTND+XLPfWPOaG6OOsJuuvN5M11Ssm6Id06t2f
         y42r2VxlrfWckRu1FMaxhPqbRUON+k3qmMeEI2FNhvnaQmSP8yuWJZmQLk1FfT62GaxB
         JFH9EWUgGugyCUwBDQgKOZZcGBW+q8UgGiL74ldtiFfo2P4Ug2OIlX3/PcnfcqgO5Pls
         c5Xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769061631; x=1769666431; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVdaKC8FZmRo8NG738WVpj60/DWB9v8M21xxR61tSTg=;
        b=MKGwMKd2oaYSgt1Ocpk4hatYKm3NLELt9Z6jmBCMisG3UM6QqgfYt6cI24plTjZfHq
         5T4Wk9aaUV/KrzrIVaRcaJYCiyFJMZiNCtCEy5mkkd0gtrjvjYpMJUrbn0XAbGNe8yJz
         TvDRscAIPCikKH7br6ZuLtRsVHHy4FhYLQICpwfdSDgoiA/eT9j/0+1pegBz2sCCFvln
         UuQES9WWFuhYHtD9dPC32AHHaxpVOzq1L5Z68FV5CXZAU9P2cWnwVJ+nFOu6Y295e446
         N4Aphj7IKpIxZReGg3VmjWQZoT/eNt2sIaMX2v4yU3Gosb8k0sVupR2L82Om37w1sEoJ
         oCVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769061631; x=1769666431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iVdaKC8FZmRo8NG738WVpj60/DWB9v8M21xxR61tSTg=;
        b=mvW3Q/PMhB3bybcTRNgqY+aG3Yzb4cDMlnmgLnDUX+e6Z95IfT2V7NeBYAprVAdQzB
         SQy1n7daYGe95vzJV/dtCuVldvriS+epusPT2jI+lQmAgLhnsQE7IvNo+U5OnWAq9Wgh
         T1dfam3hUJyjpd2LqbwF3+BiCsRmtqIp4t6ty6kRXF+adzQJkKkjZq9gW4hTRAgnjz6Y
         APscwRGDum/4P3MsXZ4Vq8CAOPjKYDjPB+wkCs6cvzwhgMaVaYiS9ANY13ZbBaYCYKOO
         xZ4HxGgY2Av8h/QMjE3i2Sixfq/6MJDJVoNEjoD+GKmK40sYOkQ8HfbriJ+f3pCj/gG6
         4pcA==
X-Forwarded-Encrypted: i=1; AJvYcCVEi0AvVthxTrDFppQVVFt4KCld2/oapctXPxQzrUm5+21u19H0oisqr6gT7YYbZHzhBTGQJZW19mXBbCE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdi3EQ52lj+97J1qKKV5uGM2l40Jl+oq5gz6tsbwEDsKtC2f0k
	TSua+bQm3HK093PHE7vU9D4KN5TWBrc76Uu1qPYyYSeGagKoUhB+83B4HgQgpyCETqYhAX71LCu
	7qRMEc74NNLjmcM+vnckqId3K7y5Yknk=
X-Gm-Gg: AZuq6aLfKRdOfNOrAMRH+0SMY0oZ4oNYcty+bxugx9j+fm/FukReN52vhpDCa01Kl81
	yNeH8NnmY3xiRPfZxFeL2RGPb02F3dDwU6KLdjI98yg6EacQzMsLgTP0jjrizspk+6KIIRYztLh
	0EGu1Trl30ue3q/KXvZQLx2b1DKzRPogD1R7/pCu1ZbHJBViRqOlGg+fOz++WdhCuADrIn/TKoG
	c/XFjU+0nKh8WqSnCVUgousiOva5cFZ2n51VRmTXTwXuJoV+mttUXItPS+zpnqgW/uBMNi/+0Xj
	lqSCy/0ACBkRAf3UB/iUuaULzvUqsO5pn6gl+2/bN0B4gi/PPYuLCoF98vOO3zv6KNFQhpx66ST
	LqCpqC4ejl8PK
X-Received: by 2002:a05:7300:dc85:b0:2ac:2b5b:a567 with SMTP id
 5a478bee46e88-2b6b410771dmr8603006eec.6.1769061631179; Wed, 21 Jan 2026
 22:00:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120115352.10910-1-luis.augenstein@tngtech.com> <20260120115352.10910-14-luis.augenstein@tngtech.com>
In-Reply-To: <20260120115352.10910-14-luis.augenstein@tngtech.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 Jan 2026 07:00:19 +0100
X-Gm-Features: AZwV_Qg2rTUbi0epRbMapeXu4Eaoaebk8qMK9vCVJG7zW4JQ-R4AxZm4gJxFe5Q
Message-ID: <CANiq72k4bNpxVKU=Ue6yWDJmJf7u14WJhPARL-Gp16S-02xxZA@mail.gmail.com>
Subject: Re: [PATCH v2 13/14] tools/sbom: add unit tests for command parsers
To: Luis Augenstein <luis.augenstein@tngtech.com>
Cc: nathan@kernel.org, nsc@kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
	gregkh@linuxfoundation.org, maximilian.huber@tngtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	TAGGED_FROM(0.00)[bounces-10790-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 0DF6C621FF
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 4:31=E2=80=AFAM Luis Augenstein
<luis.augenstein@tngtech.com> wrote:
>
> +    # rustc command tests
> +    def test_rustc(self):
> +        cmd =3D """OBJTREE=3D/workspace/linux/kernel_build rustc -Zbinar=
y_dep_depinfo=3Dy -Astable_features -Dnon_ascii_idents -Dunsafe_op_in_unsaf=
e_fn -Wmissing_docs -Wrust_2018_idioms -Wclippy::all -Wclippy::as_ptr_cast_=
mut -Wclippy::as_underscore -Wclippy::cast_lossless -Wclippy::ignored_unit_=
patterns -Wclippy::mut_mut -Wclippy::needless_bitwise_bool -Aclippy::needle=
ss_lifetimes -Wclippy::no_mangle_with_rust_abi -Wclippy::ptr_as_ptr -Wclipp=
y::ptr_cast_constness -Wclippy::ref_as_ptr -Wclippy::undocumented_unsafe_bl=
ocks -Wclippy::unnecessary_safety_comment -Wclippy::unnecessary_safety_doc =
-Wrustdoc::missing_crate_level_docs -Wrustdoc::unescaped_backticks -Cpanic=
=3Dabort -Cembed-bitcode=3Dn -Clto=3Dn -Cforce-unwind-tables=3Dn -Ccodegen-=
units=3D1 -Csymbol-mangling-version=3Dv0 -Crelocation-model=3Dstatic -Zfunc=
tion-sections=3Dn -Wclippy::float_arithmetic --target=3D./scripts/target.js=
on -Ctarget-feature=3D-sse,-sse2,-sse3,-ssse3,-sse4.1,-sse4.2,-avx,-avx2 -Z=
cf-protection=3Dbranch -Zno-jump-tables -Ctarget-cpu=3Dx86-64 -Ztune-cpu=3D=
generic -Cno-redzone=3Dy -Ccode-model=3Dkernel -Zfunction-return=3Dthunk-ex=
tern -Zpatchable-function-entry=3D16,16 -Copt-level=3D2 -Cdebug-assertions=
=3Dn -Coverflow-checks=3Dy -Dwarnings @./include/generated/rustc_cfg --edit=
ion=3D2021 --cfg no_fp_fmt_parse --emit=3Ddep-info=3Drust/.core.o.d --emit=
=3Dobj=3Drust/core.o --emit=3Dmetadata=3Drust/libcore.rmeta --crate-type rl=
ib -L./rust --crate-name core /usr/lib/rust-1.84/lib/rustlib/src/rust/libra=
ry/core/src/lib.rs --sysroot=3D/dev/null ;llvm-objcopy --redefine-sym __add=
sf3=3D__rust__addsf3 --redefine-sym __eqsf2=3D__rust__eqsf2 --redefine-sym =
__extendsfdf2=3D__rust__extendsfdf2 --redefine-sym __gesf2=3D__rust__gesf2 =
--redefine-sym __lesf2=3D__rust__lesf2 --redefine-sym __ltsf2=3D__rust__lts=
f2 --redefine-sym __mulsf3=3D__rust__mulsf3 --redefine-sym __nesf2=3D__rust=
__nesf2 --redefine-sym __truncdfsf2=3D__rust__truncdfsf2 --redefine-sym __u=
nordsf2=3D__rust__unordsf2 --redefine-sym __adddf3=3D__rust__adddf3 --redef=
ine-sym __eqdf2=3D__rust__eqdf2 --redefine-sym __ledf2=3D__rust__ledf2 --re=
define-sym __ltdf2=3D__rust__ltdf2 --redefine-sym __muldf3=3D__rust__muldf3=
 --redefine-sym __unorddf2=3D__rust__unorddf2 --redefine-sym __muloti4=3D__=
rust__muloti4 --redefine-sym __multi3=3D__rust__multi3 --redefine-sym __udi=
vmodti4=3D__rust__udivmodti4 --redefine-sym __udivti3=3D__rust__udivti3 --r=
edefine-sym __umodti3=3D__rust__umodti3 rust/core.o"""
> +        expected =3D "/usr/lib/rust-1.84/lib/rustlib/src/rust/library/co=
re/src/lib.rs rust/core.o"

Hmm... Is this supposed to have two files in `expected`?

I mean, `core.o` is really the output of the rule, even if it gets
modified in-place in the middle.

Cheers,
Miguel

