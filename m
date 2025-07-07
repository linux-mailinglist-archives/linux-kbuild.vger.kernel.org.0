Return-Path: <linux-kbuild+bounces-7895-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE7AAFB35E
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jul 2025 14:34:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30D70189F635
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jul 2025 12:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B6EA191499;
	Mon,  7 Jul 2025 12:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Twbp3KKj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A669B29994A
	for <linux-kbuild@vger.kernel.org>; Mon,  7 Jul 2025 12:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751891683; cv=none; b=U22wBoxxC/NLhi91rUaDcTFL/TEE4Pj9/ub053X/s7efG1YVEhXUaIQEgypX9lGPxr19v16VLAk7EW4S7kiM0n9HFQ13XrujvwOhbEJX5C5/4tdlVj1t2zlQg0RfGq9VRoYKvwJiB9YEABYjAK49MEZCDpZ4dH5VhTCcfGHBRoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751891683; c=relaxed/simple;
	bh=ciuhiRaoNpFx8uv0i3S5oEjGJUszgKy8bu0RS3jVlvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nf635P/jBRxsKkNLjwvj5z2NICYeIWOdi/uvzeO6kkFA28oiTkhxawLazqNLGnuz5v+nHOpddRt6ff8rca1LgGqZfGKiY9deEsvj6GmZty9m1Wv8HOKsY8FXNT8csSaMl5PbQYFJ8n7HUH2sJFPdAzDcIK3QGIDjESbHJzG9Lu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Twbp3KKj; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7170344c100so13810377b3.0
        for <linux-kbuild@vger.kernel.org>; Mon, 07 Jul 2025 05:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751891680; x=1752496480; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ciuhiRaoNpFx8uv0i3S5oEjGJUszgKy8bu0RS3jVlvY=;
        b=Twbp3KKjTMdhz72DjSsNEyF71Z2zU/Oc6Mp6FUbWhrartfSY/Lb2k9VuJSSYL/fwMO
         dOnJG3Iyfleot0EEd5gaMAdmhYvQAENANaQGJB3v+6NdDX0/BjKEt0/YH5LufiRLAp6X
         58JNit++QcqLg2VNljDUUEtxrIqHxPn1XHT8IVaoDtgVrbZYK7uh05/lUSS6l36ia4V8
         wAlZaGQ31SWkGSr9Ic/fO3KtHZlhekMs2vN0spJMl5cRUW22dplit4731zSdpbISFL4j
         p6dRs21Uge4cUmDYEOVM/XgFpFz4eTvPODHsXLT1dImShzV2Ni5zHjoZSc6hKU1CBBuS
         mGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751891680; x=1752496480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ciuhiRaoNpFx8uv0i3S5oEjGJUszgKy8bu0RS3jVlvY=;
        b=q9PISWdR3PzNWxouy/5Eha5mfSfxUK01uP3GWlLvljWgAavTcBpF2OxIwBPQOH3Mne
         A+EXkvLOF+/D9MZHr0//6IG5Yzzfb6pUrzcdEQeeCErygRXvMN6PN0MQ+f3WmyKWHmCD
         NC6W0CmB0QLFD1edtydEmJsenPDXSp0KxqP4VZJ1LO0r7Eust9EUzoqDmRuAeeKgxp93
         xysIyldSo7g1VhL2mbfG0NH1ZyUkAIRutpHjNt5wGvVRxzArExY+VFdOzUlpabxJJIcu
         8by0wCibI0rwOgF37wC1TUh6YMPcxFkMfGiLwgei1J5Ke4KmfNqmxiXS0+e0P0Th2up3
         qn+w==
X-Gm-Message-State: AOJu0YxmWBB87fF3twYUC/jnlHbaCQs8oql31PaNUGV1V4TVELvxgs+q
	j39BNPNWebiIBABzWgfg08Aj9nZvGVK5SLABaZyBP74iNuKAwV5DRwEGhltQmCE26hUPjOjcuwU
	3nk34XbNzKx/W5SlocfGdj2NeL9Zn91P1SSU2kZJB
X-Gm-Gg: ASbGncu+w6SXxMc5N/i3EcVFHph9znHSGv3lu1B8GZ/fb9hRTuERQSILMXsOcafOWbV
	EH7sZAct/iyXLzZT/H4b40kIYSJporp9Z5pExlm4xjNdb9LkyCJTM5fF8ebY+zVZa6US7KL2Uzx
	RiaGCx90mixlyyItis6RMIURclHPW0s3dsoOHZCmTJllbZ4RwIkIp7Lza69ITAZW2XnFE/RW5f9
	XSDaF95MDY=
X-Google-Smtp-Source: AGHT+IHhAOIKJHBlleR6lkwGm21nEqLGAnY2t+v9+E3nEsiqfIJaOPqLez2JblQOcgFrZpe83/0Nyr1Fn9ssBIoIe8o=
X-Received: by 2002:a05:690c:640d:b0:70c:a57c:94a3 with SMTP id
 00721157ae682-7166b6cd964mr156878117b3.19.1751891680369; Mon, 07 Jul 2025
 05:34:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250706210940.1720720-1-sidnayyar@google.com> <CAK7LNATbinPVLDqxzPQn9QNQGyacB5rDFsjQwwygy2KEjbhRFA@mail.gmail.com>
In-Reply-To: <CAK7LNATbinPVLDqxzPQn9QNQGyacB5rDFsjQwwygy2KEjbhRFA@mail.gmail.com>
From: Sid Nayyar <sidnayyar@google.com>
Date: Mon, 7 Jul 2025 13:34:28 +0100
X-Gm-Features: Ac12FXycrHdSmwbObL3rEnm5r-YMh5Xm9PPZd1Vpp9_5IcdhcLYezo7pWnL3HHc
Message-ID: <CA+OvW8aVreTHV8crcaX7Rbis67-YV=s1qSf7wuURY85MLWMoLQ@mail.gmail.com>
Subject: Re: [PATCH] modpost: check for NULL filename pointer in find_module()
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 7, 2025 at 11:25=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Mon, Jul 7, 2025 at 6:09=E2=80=AFAM Siddharth Nayyar <sidnayyar@google=
.com> wrote:
> >
> > Pointer for dump filename can be NULL when a module is not created from
> > a dump file in modpost. The find_module() function should therefore
> > check whether the dump filename pointers are NULL before comparing them
> > using strcmp().
>
> I do not understand.
> I do not think that scenario would happen.
>
> There are two call-sites for new_module():
> [1] https://github.com/torvalds/linux/blob/v6.15/scripts/mod/modpost.c#L1=
576
> [2] https://github.com/torvalds/linux/blob/v6.15/scripts/mod/modpost.c#L2=
117
>
>
> For [2], mod->dump_file is set in the next line.
>
> [1] is always called after read_dump(), where
> is the only user of find_module(). [3]
>
> [3]: https://github.com/torvalds/linux/blob/v6.15/scripts/mod/modpost.c#L=
2115

I see that this is not broken at the moment.

I was working on a patch series where I am making use of find_module() afte=
r
read_symbols() is called on vmlinux and other object files for modules. I
realised that find_module() does not work as expected and decided to send a=
 fix
generally. If you think find_module() does not need to support the general =
case
of finding modules after read_symbols(), I can keep this change in my patch
series and not submit it separately.

--
Regards,
Sid

