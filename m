Return-Path: <linux-kbuild+bounces-4222-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2319A91CD
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Oct 2024 23:12:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B0DC284060
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Oct 2024 21:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B14F1E2307;
	Mon, 21 Oct 2024 21:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bal5nmP/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7AD1E2308
	for <linux-kbuild@vger.kernel.org>; Mon, 21 Oct 2024 21:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729545154; cv=none; b=ian3GmGFZAML+K1fhDcjM41z9SCVLFjkZI8jJ/dEr6Yc/QeFF/AWCeaHvczA1rt8Daa0TcZn/8lwUOwFeZr04kWBGxyRgGwNc35u6iE4A8Oklcp2l7sDhtSy2oRf+2i3li60tqseC0AIuxXD6kvzinjjvd9/yB0GLPfqGE6fy2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729545154; c=relaxed/simple;
	bh=vT8uNYu+6v08jfCmB1LZB7EQjXInFV7mAuG4Z1WlmKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tl9Gbv4l6cQ2kIryfEjdVoEly68NkyrQM32CUCnORIYP9udbnYibtT+ewIrtajriQUDTM3BqvZGvTeVeszt1reqOtRcqq1vTkdTyaoQvyiR0ThY3oS+HjFXmB45zHBSNjTt88anRfky52IytDqdJsa4qA42SFQ11qMsfpS5he1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bal5nmP/; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-460a8d1a9b7so42721cf.1
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Oct 2024 14:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729545152; x=1730149952; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9SgtYJ7ruMEHetOUIPlHgPbj24nHZho9hMlB1OIKsU=;
        b=Bal5nmP/YDOeazS02HBKQj3po7eam9fM35N8ckRv4t2eyayKGLV+lSqXxmcWz/oZvg
         u3hbY20J9awjnSvboLN1O8SejIlXPKKQRjoMidML7pGfk2JbZ02JI3HQTnYNYWGVwl39
         5bHywUf4Q+/nxjJxu+cbvw4uUmYScZUk6y1MYfs+Jo+pgDRi98CatUHOgGfahlIDiGNK
         OKzBiof0s8oAfist9aaeWMHFCCDSmwZgj0czFKewjBXOVhtIzStgI8vtVQTc6lfp8fqt
         HZFVQbpPydYYDdD/c6ohM5u+XRjOS6v2URl7wvMV4mFct31jJWyZ75SUELNLOGlDAZJ+
         zlsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729545152; x=1730149952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9SgtYJ7ruMEHetOUIPlHgPbj24nHZho9hMlB1OIKsU=;
        b=VvTgZhpxs3j5JK4zAjutUKwX6xI9jEUhfm7LTvH8DrDpP/VJfRf+TqSuBOdDkcImyG
         AjGWg1+r4lcNUpJWZZk34rUqM9RiUkj3fn+cgOrkJ7ewyaJiZolcOICAKIbB9POl9xop
         EbqlG6xf5djUCoEyO/34SYW503OQWYMZDBeDTTUZ8OyVmtY62URismP1i9oXVGsBDYkt
         ntn/OXOwBU38Xo//rvw5Rd93Ym8+D3zHznxpAl7XJlKZGDtucATd19toZ4s6Ezf8QmI3
         pNihmbNszJ84nbFv8qYd9dtyR+7EgKbcJRnQAdEClNzUXF/Do+unUOHMrkI0UEyaXlg/
         JrlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXea8/zFYFeS+7SCZWo8+MV20/ZUQO6WkrQBxNutw5ZeRuQDT8RsDZujTQwwonKHtu0fZ/n4PpOT8y0FJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgXPbBHZ6rpgQupmq/R7N5MIra2liHND/33BQQk1kx/hee27Gx
	zF+6+j40b22lqm9V4yVUc/Ro0KRZe6lCej/0ZMLQmY0SklG3F8vRbLkcG4aga/v3mfsvB2a1PEP
	DyffmavF1/kw0t17w6t0kyA4fzf3L6Q+88Zuv
X-Google-Smtp-Source: AGHT+IGzo2TISqKT3Jl9CfeQZcohbh2s1lnUXzilu8k+T0K2sU2TWbK8wa3xZAwv92x9q/+t8oEme9GGEjWaFA3FT2U=
X-Received: by 2002:a05:622a:4b08:b0:460:afbd:4101 with SMTP id
 d75a77b69052e-46100a7fcd1mr1133581cf.4.1729545151682; Mon, 21 Oct 2024
 14:12:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014213342.1480681-1-xur@google.com> <CAF1bQ=SQ9rFdwRk_waQvn4PW7x6T1uJmJ8qNqj04oRKmujkCQw@mail.gmail.com>
 <20241020032523.GA3652325@thelio-3990X>
In-Reply-To: <20241020032523.GA3652325@thelio-3990X>
From: Rong Xu <xur@google.com>
Date: Mon, 21 Oct 2024 14:12:19 -0700
Message-ID: <CAF1bQ=QYnC+0EREWcp1-NXCtCC6KqJf7k0LRxqaTY7fxWSOZ8A@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] Add AutoFDO and Propeller support for Clang build
To: Nathan Chancellor <nathan@kernel.org>, Stephane Eranian <eranian@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, 
	Breno Leitao <leitao@debian.org>, Brian Gerst <brgerst@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Li <davidxl@google.com>, 
	Han Shen <shenhan@google.com>, Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maksim Panchenko <max4bolt@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, Yabin Cui <yabinc@google.com>, x86@kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 19, 2024 at 8:25=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi Rong,
>
> On Fri, Oct 18, 2024 at 11:20:02PM -0700, Rong Xu wrote:
> > Thanks to all for the feedback and suggestions! We are ready to make an=
y further
> > changes needed. Is there anything else we can address for this patch?
>
> I will reply in a separate thread for visibility but I think one of the
> biggest open questions at the moment is trying to find someone to
> shepherd this code into mainline.
>
> > Also, we know it's not easy to test this patch, but if anyone has had a=
 chance
> > to try building AutoFDO/Propeller kernels with it, we'd really apprecia=
te your
> > input here. Any confirmation that it works as expected would be very he=
lpful.
>
> I went to take this series for a spin in a virtual machine first as a
> smoke test before attempting to boot on bare metal. This was done on a
> server with an Intel Xeon Gold 6314U. The kernel booted fine but when I
> went to run the command to generate the perf data from the
> documentation, I get an error.
>
>   $ perf record -e BR_INST_RETIRED.NEAR_TAKEN:k -a -N -b -c 500009 -o /tm=
p/perf.data -- make -j$(nproc) O=3Dout mrproper defconfig all
>   Error:
>   BR_INST_RETIRED.NEAR_TAKEN:k: PMU Hardware or event type doesn't suppor=
t branch stack sampling.
>
> Do you know if this is expected for a virtual machine setup? I will
> attempt to test the series on real hardware here soon, it is currently
> tied up with investigating a regression in -next at the moment.

We have never tested this patch in a KVM setup.

As far as we know, LBR support in KVM is currently limited, and varies
depending on the PMU virtualization model:
(1) For legacy mode, LBR profiling might work under LBR virtualization
(VLBR). However, we have not tested this.
(2) For the new "Mediated vPMU passthru' mode, there is no LBR
virtualization support at this point. So LBR profiling is not working.

I've included Stephance here. He should have more expertise on this topic.

>
> Cheers,
> Nathan

