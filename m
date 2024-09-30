Return-Path: <linux-kbuild+bounces-3834-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 827A198A6FE
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Sep 2024 16:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A72451C21C7E
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Sep 2024 14:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA89B191484;
	Mon, 30 Sep 2024 14:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uifwhi6P"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BF518E758;
	Mon, 30 Sep 2024 14:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727706554; cv=none; b=NsN8k4D/R9bl/3TT84DPRnd+X3Ph0LZDaY0eaZNaa2cDaBtaRLdC3EGUNp6j/+JRBJX+lrNkfsW2aPP0QReC4PwbLZODMgdmK6c9KP4yeMkHZ048MAmbL3Y7U8qNJ+lIlRIzZcBJBVKTnBBlHId9Jv9Jjm0gyzwyyfPxIrxpblI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727706554; c=relaxed/simple;
	bh=dZXin4+GRSMludy5RtFwIifr3KWtFLMopND6FYwycBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ViVQojUeYzZMBBuBvk5Os9je6NqhyNYbzjKAeyzDZZ4u5UWtdsKtGjZp2wiTW4W66ddYNmyuKvLMQGmMEPrXOqstr86MrNDpXEgAiR4OkkA4ipAEQSgM0sjxlZqsBzTV/jcl0Wk+nvqibkm6oTevLeokU81YMGi3DO+96NTIevY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uifwhi6P; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71793afc07bso152023b3a.0;
        Mon, 30 Sep 2024 07:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727706552; x=1728311352; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDNE1FkKcdfZWcYc+nVbhJ6ewjvhhPypgqB+D8tWaPo=;
        b=Uifwhi6PV6XkezyYw8agswVWgVcKThtgbdXVzUzl6vYJPkQdpcx1D6afd97fE/g8cA
         NHOlNr6aY/lMYeXQuTxPzyzLAW4yW+Kr4ziFy1otsa3dueMIbfmo8yY78IbzfBIjG739
         3L0VHCO6//1TzuNM7MwWdGd4/zADR0sLoaDEz+8tSXsLuTh8R2EWbixlhWAuEkdU+XCQ
         Jpyv8qgbfL8+zCyQC9PYbNXB9ixT8da8dV+S5h0RVTn/0tqSbYb6sjlq5uGc/PJ8V3Hk
         gslbdUG/PbfN24X+HyUcY+g1qUomwE57jI3NX5OkPnoIDiSqw3yZ0J1KYGRCf100UTKx
         r7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727706552; x=1728311352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TDNE1FkKcdfZWcYc+nVbhJ6ewjvhhPypgqB+D8tWaPo=;
        b=fnz/HnQXvx4S4xRYclwUSr6GaRrzZwjhQ7hLj3oGZHHPVdUrYNpRVKi985Onmqg4+V
         uHeJtksZpsC6WJAr98TKbDtdGlSuCdZ7dAJ94TFJ1h1p5+xb4oa+3gk1NYViLwC2gGZd
         TvzxDFg04JGAd631vJXdWTPnOD/n8xnFeZsSV+w7n/ChUbcA8d7A1vVAECXb3/rXRv4q
         mM4lysMmZ/8wHFVUjIVso+ipfS0I1E9GW7qHmCTsNqhPl3aN0+3CSpYozBaTnVLDy3W1
         dk75iiytdqBR9BaXL5mqxJeLLZoNmyShZebm+v3PcAKIEmq+d9MNAb041sxfTqJori8b
         D1Tw==
X-Forwarded-Encrypted: i=1; AJvYcCU+XQHq+Ld6J6bXw4QdKZJYQFIWx9b/L6xD3qNOxHMlDwYzeetn753AJqZPaC1GizqTgZPt7Hm+hm0T/eIZsvc=@vger.kernel.org, AJvYcCUWJF1sZUDnCpG8GirXkZkFRSTzv6S7yP85jlAHLq92/mtvbSsU3vCOJ77PGR9wNbbtYpFhhHNzvJD5vzM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHCrMHx8M9EqT1cRYsvze0Q4kwzPpZUTjw0XwrQLH5cBiDGUJT
	p3CvxS7vOGqB/UqiW890j4vdpIFlG340mB7CtzQrHmuYX/5dMhWpwt6TBWESpUpJEt6SkyLdx1o
	o+MDIqYaKp6zNQo62TZwOVLinAFOVbGzH
X-Google-Smtp-Source: AGHT+IH0H65JVjk/DdPd3VkcZSOZq/CcyaO2lcFUbYvdGpJhoWh9uyu/2BNWxeYzLp9Sd78yFqanHsqKG9UdRb95yYk=
X-Received: by 2002:a05:6a20:8420:b0:1cf:2be2:6525 with SMTP id
 adf61e73a8af0-1d509ba8450mr5385056637.11.1727706551787; Mon, 30 Sep 2024
 07:29:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240917141725.466514-1-masahiroy@kernel.org> <CAK7LNASDcpk3k+SKZ61dPW_D=pqfekEcnu2c+00MynpomE2RNw@mail.gmail.com>
In-Reply-To: <CAK7LNASDcpk3k+SKZ61dPW_D=pqfekEcnu2c+00MynpomE2RNw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 30 Sep 2024 16:28:58 +0200
Message-ID: <CANiq72mWvnnJqFKU_YYUmtbG0oQAB7AyEMRCk7w0mC6T9kEoGg@mail.gmail.com>
Subject: Re: [PATCH 00/23] kbuild: support building external modules in a
 separate build directory
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 28, 2024 at 8:50=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> I CC'ed rust ML because Ack for the following patches are appreciated.
>
> [07/23] kbuild: remove unnecessary prune of rust/alloc for rustfmt
> [08/23] kbuild: simplify find command for rustfmt
> [11/23] kbuild: check the presence of include/generated/rustc_cfg

Sorry, it was in my backlog after the conferences.

I am not sure what the base of the series was, but ran my usual tests
on top of v6.11 and then on top of `rust-fixes` after some manual
adjustment in both cases, and things appear to still work fine (i.e.
what I usually build, without taking advantage of the separate build
directory support).

Moreover, I tested the separate build directory support (`MO=3D`), for a
trivial Rust out-of-tree module, with a subdir as well as with a
directory outside the out-of-tree source code.

I also tested the new approach suggested for the out-of-tree
`Makefile` (i.e. `export KBUILD_EXTMOD` and `include
$(KDIR)/Makefile`), and it all worked as expected, so:

Tested-by: Miguel Ojeda <ojeda@kernel.org>

...except for arm64, where I found that I needed this bit:

diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index b058c4803efb..4cd9a1f2ec3d 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -71,7 +71,7 @@ stack_protector_prepare: prepare0
                                -mstack-protector-guard-reg=3Dsp_el0       =
 \
                                -mstack-protector-guard-offset=3D$(shell   =
 \
                        awk '{if ($$2 =3D=3D "TSK_STACK_CANARY") print $$3;=
}' \
-                                       include/generated/asm-offsets.h))
+
$(objtree)/include/generated/asm-offsets.h))
 endif

 ifeq ($(CONFIG_ARM64_BTI_KERNEL),y)

Cheers,
Miguel

