Return-Path: <linux-kbuild+bounces-9523-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C006C47EB8
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 17:25:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A131F349F8D
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 16:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B243E27B353;
	Mon, 10 Nov 2025 16:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3yuXMR8I"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB5027B34F
	for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 16:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762791918; cv=none; b=eQmoJocZLCdJgLqygulRBGgi73nCCoKdE+lxjxFCCAIXJqenP/2o9/zDtgRjcOWUXIStnNkHVLW66iK0s3zyozU01mDV6bTwjTNXtmXNOXXrxyZW9PcEfp2mBSlfj98bUoxzWX4KP2UxuWE0d79pnWJsNc092WZIZ8a+OzdNG1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762791918; c=relaxed/simple;
	bh=+XdVuzl+5OjnvaE1DbT7/b/RmZhiYffoxNycigHS5xM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=omlHVQ2mAeKCvNh2qZcAEppPOcaIQOtPAL77xarBiWRaiHLE62fxjsiKhi9OU/I+5IzcgBSpLz9rzcuyCQ3XzDK0WboHnVAj/5q7i8oJXgRBSvWBbQynhI/fh9GwuhUnKd5Lc8oaC6chJWSuE/uvriTFi20WGbLc9i0Dt4fxb2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3yuXMR8I; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-88246676008so18372916d6.3
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 08:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762791916; x=1763396716; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9SA+Oyt3urlxF8erNwoXRcqQ1B+Xtx2kUos6VgD610=;
        b=3yuXMR8I2yXzyemuQHWtQbvjgyAhEUPtwgPABTz4Y0Lbh4kwenMUvKpdcNMv/j5SD8
         OksN/TpI7jlMoZcWs9uc4H2kJpyfymF0vDo3Hg46I+bK3ia/6DrR5O2zpyP/cJ60Ei9Z
         R/EzrRdSgotSi+8Ctiqsy1sWHfrU9VJ6mz2hQRL5GkOrHP7chVUHBsI9JdOUo/Nt0Dql
         YiqWLXVVhUqZZemMEbpLpU09SZNshE5Gc6e82MH/FIMsyi4MZeVMolrxIAvrIy82Skud
         qe2d425Oogg5LRILn06O6YAV9+j/dUtRXQEJQlrhF7ubbaTWOhpFck8aTO0nf4lqB+wc
         pCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762791916; x=1763396716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c9SA+Oyt3urlxF8erNwoXRcqQ1B+Xtx2kUos6VgD610=;
        b=fRHVHIYXaa691dEHcXopyJw1ebv2omaf7GhGP0sIFoLndTu5FL8geHyuHeHDTs+ypQ
         ObW/IKaTEP8tfCHVNlJMa0VD5RgJ1Co0Mra2iLSn5DlM0qDqc7GIheieO4k2NvWPJIu8
         lWb64V5x/nl1vv2xSvdxN5vyrQ+TyIFsdugL0B44HJZtH6PpAi4oqN9eXnUObJgQo14a
         vnrP+xtlxT6o7b0BSNrBQ5JD3aXytJkRsAIZw1ioOo4BcjCVJneaM6ElNX4Sl2V05rEx
         iNLFLON5VGqLIObLyEXCt9+9Dd1YKi55MWYIwg4IWHpDxeR0O41/OQR6/m+dej1CcFlc
         6jlw==
X-Forwarded-Encrypted: i=1; AJvYcCUdNeg7Sd9I5DxYmnc8TdjeysOBTddtV1L/W0HmjPxjDrhfbr42FhRVGrdzj+QD+swBs2MdbAeQrB3XhHE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvm7z7QYv4gFEYcFrxvLwVk5fGIXAnsUlp+g8m1EbOM2GvTwJL
	jmgF36CUuwwv8Dxzs2rlEw1TVqzZgBHhu3GRAF3BENBRVPQ7bWoPfTxrruS3JJ4AepFIuMqVo6m
	MLYCJbLmpvVFmipiWvBEglGniKFzyYl+VePO9M8Ml
X-Gm-Gg: ASbGncvqVtIkKH2yWLIHuEfFiA2N39r1ILPHmmySwkhzHZd3Q+8S2ZjiPAEAjrVv1RF
	FrFaMMe/whnnpkEwDcbL2Zq+WXOZP5Oa2qGIsqwa/+zFIYQlq1Ni/9I9j1HMsuCduQape8dw+f7
	DluEdZlDvhBj9+V525siTl/lcFUDw0Zus1ulmT17onrYycOOsy/hAFgFGKY/ra4AhYDXUqL0AQZ
	OFuJIVtA6yIXe4OP2I1ROC4DY0DKoePVPf2hmzbRT/mUC/Z79UntGflciPSBFpjCO/s2ycpzRGM
	yrP2s0dybSJgNWc=
X-Google-Smtp-Source: AGHT+IHpxAHAI0f9Cr24tNS6jOzBKv+3mGRu+Z9H6Txpc480qOR0dPNsaiR/3XasB7O8AH8S5J5ulzFL0knik9fmYsk=
X-Received: by 2002:a05:6214:600f:b0:882:4987:360 with SMTP id
 6a1803df08f44-882498705a3mr75490586d6.62.1762791915502; Mon, 10 Nov 2025
 08:25:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <da6cee1f1e596da12ef6e57202c26ec802f7528a.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <da6cee1f1e596da12ef6e57202c26ec802f7528a.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Mon, 10 Nov 2025 17:24:38 +0100
X-Gm-Features: AWmQ_blSpUzzxuUgQTtcq9gjImncZd1NpVlVJACeWgHgjGc0p5BSkakhSm40GYM
Message-ID: <CAG_fn=Ut9JUpStLiO+GsoBpn3d_EyyttcuBby=EKzuxkKdcKcw@mail.gmail.com>
Subject: Re: [PATCH v6 10/18] x86/mm: Physical address comparisons in fill_p*d/pte
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, 
	kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, 
	ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, 
	morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, 
	baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, 
	wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, 
	fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, 
	ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, 
	brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, 
	mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, 
	thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, 
	jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, 
	mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, 
	vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com, 
	ardb@kernel.org, Liam.Howlett@oracle.com, nicolas.schier@linux.dev, 
	ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, 
	broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, 
	maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, 
	rppt@kernel.org, will@kernel.org, luto@kernel.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 9:07=E2=80=AFPM Maciej Wieczor-Retman
<m.wieczorretman@pm.me> wrote:
>
> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>
> Calculating page offset returns a pointer without a tag. When comparing
> the calculated offset to a tagged page pointer an error is raised
> because they are not equal.
>
> Change pointer comparisons to physical address comparisons as to avoid
> issues with tagged pointers that pointer arithmetic would create. Open
> code pte_offset_kernel(), pmd_offset(), pud_offset() and p4d_offset().
> Because one parameter is always zero and the rest of the function
> insides are enclosed inside __va(), removing that layer lowers the
> complexity of final assembly.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
> Changelog v2:
> - Open code *_offset() to avoid it's internal __va().
>
>  arch/x86/mm/init_64.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
> index 0e4270e20fad..2d79fc0cf391 100644
> --- a/arch/x86/mm/init_64.c
> +++ b/arch/x86/mm/init_64.c
> @@ -269,7 +269,10 @@ static p4d_t *fill_p4d(pgd_t *pgd, unsigned long vad=
dr)
>         if (pgd_none(*pgd)) {
>                 p4d_t *p4d =3D (p4d_t *)spp_getpage();
>                 pgd_populate(&init_mm, pgd, p4d);
> -               if (p4d !=3D p4d_offset(pgd, 0))
> +
> +               if (__pa(p4d) !=3D (pgtable_l5_enabled() ?
> +                                 __pa(pgd) :
> +                                 (unsigned long)pgd_val(*pgd) & PTE_PFN_=
MASK))

Did you test with both 4- and 5-level paging?
If I understand correctly, p4d and pgd are supposed to be the same
under !pgtable_l5_enabled().

