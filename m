Return-Path: <linux-kbuild+bounces-6409-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59554A7BD49
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 15:11:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C234E189F420
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 13:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB951EB5D6;
	Fri,  4 Apr 2025 13:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f3pm28tC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA941EA7F9;
	Fri,  4 Apr 2025 13:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743772309; cv=none; b=pihvQgorcobSXh1nkyM3MT0Et4FqJ1hr826m8tqI63Uida4jbYiCIvkSBjf2SDhvN9pGHVWauf8E16WBcYA5S9AeSmzJwpQhFLdoXdHExGuNL7ZUNwixV7s3lqw9xrLaU+YMuMRX3GcKaiEhMjCrz1686fVf6aPfZlWC110bkro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743772309; c=relaxed/simple;
	bh=e7Qmgwj7aF2QAr3dyq13YS6XlLKt3HijX10NP2k0Bpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BcjbK7Uq7OV6ZjO1oPddHUB8R859O1TQxsKo8Bb/BvIz4FaheEih1SP1XNZDCOGmN4azUEV+2lukmSXyGR5WMPmpQ7pkquHXAvqEgZm7GyTH3BkyWCCLQN8f7zaK4UjdKTkbY/ndaq6TNGHua/GpxvmXNid8eGV7jmejRIMqFGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f3pm28tC; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30db1bc464dso18061561fa.0;
        Fri, 04 Apr 2025 06:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743772305; x=1744377105; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eBI7jiU94Q/DspMvzV1dDTwMFWMqwAGAHtP0uckXG3A=;
        b=f3pm28tCERXpgFfaHhSXeDIq8hjEF/Jj3XkAktJugB6a7x+cDS/OdM8insALHx6+Ir
         SutU2Uy5iqRIg4bdqClwJJTbt+haLHFd/JhNoDVMC7qAUfF9K6UvsAhKJi2t7k+a8CNw
         KpuULZ96yEMMT+KW/xthVmK0K/yBzt4tf+tVjc9QZDv0xxbont06WEssAAw8WBdrfRk9
         KGWT3YpKl3tqKvnoNB3pGEQ9C2ejmt/dLFIexOkRSEP19pK8lTFK/ZkJDWGactoWTfvV
         ulBPwycyh6oc5m9cg20MNBQ++pHGw8iDKnLImRXIVO+VblhLKsblPWW91hx8OEiKiqr1
         t1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743772305; x=1744377105;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eBI7jiU94Q/DspMvzV1dDTwMFWMqwAGAHtP0uckXG3A=;
        b=PXz6E11ZPVwFVGy2imoj32+xOhaxo7tY8q863SEGKE6gGh5HX79vmh3vkhafIvn+NE
         b9xrdwzsKm+dGHud1oGpdzfsdsXatEPRAzUf3zAAmh5inJyRh2UWKukEAG2zgse5z4XD
         0eDlw0Az1a8yVrUnl/LF0FdBnMRlP9gnx8xHLApwUoBxjaCx2k1NLuf9C3Poo32PX/2i
         jAYA6RdsLq0+Tmu1C7eYuXxLIOtLKHhX6C/yX74CsO/C4n997V7+kpOaG6U/hf/7PK6s
         7/EmUvPY4qfY4ViL+DMYI/6bGAjhzkYga9aqhDNN4CEedG/IJNWZaIuRxo5XlP7OBn+P
         XTxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwaVh2W2X4/kLjEhkj4MOyn1qKwXDq5hpNfvqPcmN2jAyU/4BHoEcXuBaV547PRW88rcvMY06QDsFor98=@vger.kernel.org, AJvYcCWxb0t1LQfWrePMAox6DbmlsgtPZhiW0MZYAm6r1b4nj3gu0jfc34wZgErGVB/YGNNa6uDUU8E8RHYbcm+a@vger.kernel.org
X-Gm-Message-State: AOJu0YyBRXDY3MThi+0yGqzpbXLLQ15vjOCHfxNukX6PIGyv6eoFhaOr
	0J1z13Eg86g5xnnjeUWwmQTwcjR6rihghTMNS7iDd1BAw0cYiwodkxGrZSJ/ag3FCfSDkUayGf4
	u6rXsxV1OF0lyrxhsEKEXxKIbLgU=
X-Gm-Gg: ASbGnct0i1uvk1Jro6iURIADliVENYcrWo5OF3PR+nyvRhxmNTtHbehzBvCUMYXD8Vc
	1PYlj/E70JylSCIjeZ/xeqBReg+fkg0koUOYZZjHcJo7RINDTABd92k43jq2ji/EKY9hkLarcEL
	FPzac46ZhmwYOQ2OUCTNNnPIacEw==
X-Google-Smtp-Source: AGHT+IE+J6guG+hfsfhEFkG5Jex32TrGIyBitLHRVB28RLS1c138mrg0Oay6deOKJMj1hsvRnL2TgWjaXSH9V6T4emY=
X-Received: by 2002:a2e:828f:0:b0:30d:e104:b796 with SMTP id
 38308e7fff4ca-30f0a1a3c16mr8651531fa.40.1743772305234; Fri, 04 Apr 2025
 06:11:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404102535.705090-1-ubizjak@gmail.com> <CAK7LNATO1RfACvWhHJuLi-FYWMnSn6+Tp67-EZtVWNk+RCSTVQ@mail.gmail.com>
In-Reply-To: <CAK7LNATO1RfACvWhHJuLi-FYWMnSn6+Tp67-EZtVWNk+RCSTVQ@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Fri, 4 Apr 2025 15:11:33 +0200
X-Gm-Features: ATxdqUHrS7N9oy7CoF7N4qCSiTg-ejjdtSjw_-eNuQYqDZ34cpsvYH7Q0Lh4ubg
Message-ID: <CAFULd4bx9BGKo_4kn14rsVr44otpdjpjn_o6=zMp8iu98f9Upg@mail.gmail.com>
Subject: Re: [PATCH] compiler.h: Avoid the usage of __typeof_unqual__() when
 __GENKSYMS__ is defined
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Paul Menzel <pmenzel@molgen.mpg.de>, 
	Sami Tolvanen <samitolvanen@google.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: multipart/mixed; boundary="000000000000d2c7040631f3a020"

--000000000000d2c7040631f3a020
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 2:56=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> On Fri, Apr 4, 2025 at 7:25=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> wr=
ote:
> >
> > Current version of genksyms doesn't know anything about __typeof_unqual=
__()
> > operator.  Avoid the usage of __typeof_unqual__() with genksyms to prev=
ent
> > errors when symbols are versioned.
> >
> > There were no problems with gendwarfksyms.
> >
> > Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> > Fixes: ac053946f5c40 ("compiler.h: introduce TYPEOF_UNQUAL() macro")
> > Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
> > Closes: https://lore.kernel.org/lkml/81a25a60-de78-43fb-b56a-131151e1c0=
35@molgen.mpg.de/
> > Cc: Sami Tolvanen <samitolvanen@google.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > ---
>
>
> Why don't you add it to the genksyms keyword table?

It doesn't work, even if I patch it with an even more elaborate patch
(attached).

I guess some more surgery will be needed, but for now a fallback works
as expected.

Uros.

--000000000000d2c7040631f3a020
Content-Type: text/plain; charset="US-ASCII"; name="p.diff.txt"
Content-Disposition: attachment; filename="p.diff.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_m92syww30>
X-Attachment-Id: f_m92syww30

ZGlmZiAtLWdpdCBhL3NjcmlwdHMvZ2Vua3N5bXMva2V5d29yZHMuYyBiL3NjcmlwdHMvZ2Vua3N5
bXMva2V5d29yZHMuYwppbmRleCBiODVlMDk3OWEwMGMuLjhkMDE2N2RmNDdlYSAxMDA2NDQKLS0t
IGEvc2NyaXB0cy9nZW5rc3ltcy9rZXl3b3Jkcy5jCisrKyBiL3NjcmlwdHMvZ2Vua3N5bXMva2V5
d29yZHMuYwpAQCAtMTcsNiArMTcsOCBAQCBzdGF0aWMgc3RydWN0IHJlc3dvcmQgewogCXsgIl9f
c2lnbmVkX18iLCBTSUdORURfS0VZVyB9LAogCXsgIl9fdHlwZW9mIiwgVFlQRU9GX0tFWVcgfSwK
IAl7ICJfX3R5cGVvZl9fIiwgVFlQRU9GX0tFWVcgfSwKKwl7ICJfX3R5cGVvZl91bnF1YWwiLCBU
WVBFT0ZfS0VZVyB9LAorCXsgIl9fdHlwZW9mX3VucXVhbF9fIiwgVFlQRU9GX0tFWVcgfSwKIAl7
ICJfX3ZvbGF0aWxlIiwgVk9MQVRJTEVfS0VZVyB9LAogCXsgIl9fdm9sYXRpbGVfXyIsIFZPTEFU
SUxFX0tFWVcgfSwKIAl7ICJfX2J1aWx0aW5fdmFfbGlzdCIsIFZBX0xJU1RfS0VZVyB9LApAQCAt
NTcsNiArNTksNyBAQCBzdGF0aWMgc3RydWN0IHJlc3dvcmQgewogCXsgInN0cnVjdCIsIFNUUlVD
VF9LRVlXIH0sCiAJeyAidHlwZWRlZiIsIFRZUEVERUZfS0VZVyB9LAogCXsgInR5cGVvZiIsIFRZ
UEVPRl9LRVlXIH0sCisJeyAidHlwZW9mX3VucXVhbCIsIFRZUEVPRl9LRVlXIH0sCiAJeyAidW5p
b24iLCBVTklPTl9LRVlXIH0sCiAJeyAidW5zaWduZWQiLCBVTlNJR05FRF9LRVlXIH0sCiAJeyAi
dm9pZCIsIFZPSURfS0VZVyB9LAo=
--000000000000d2c7040631f3a020--

