Return-Path: <linux-kbuild+bounces-8652-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6A5B3ADA7
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Aug 2025 00:46:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72599174138
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Aug 2025 22:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D242853F2;
	Thu, 28 Aug 2025 22:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBpfflQQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBA8283FD0;
	Thu, 28 Aug 2025 22:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756421190; cv=none; b=SFh1otMAY5aKIFgScE7tkvTst/+MQICZ6s1wz7vOQDZOXMYWIMKBI0WMLzlqymI8ujqtNo02A4ZiL3X59Z00Rty0w6AX3LgklWdBkt/P3G2ysh+CGjvFCdMGxdoykEyVXix7C0Ok5kA5BTDn8eKYoo/EYIn4x/qxEWu1NqgTpXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756421190; c=relaxed/simple;
	bh=qZcEmOVzMLqyrHZwTmPM2aNebxZHRLa3GU1AdRbcKTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k9AEBpZPsnGvH5+7OsOvEHdB2AsWiRCSLW7IIqvncEPueN2qHPIMLjrl3mpj+FgKrCjiMCuJ0MD1wNtB5m0JzXhv2lBaED3v99xNjQns2MvKfu1OLlcCvUH63V1FbrtFQtxrHql/s4Brv60yDxI0POkEar0KehFUzs4HMQGcS+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBpfflQQ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2445813f6d1so1740875ad.2;
        Thu, 28 Aug 2025 15:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756421188; x=1757025988; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWTfsYajgxspjw0BEVIGAJj43TSZuMXWhqAKPxCzuMo=;
        b=ZBpfflQQZGRjdNrG0E6UZiWN9DrmAItS7/0J01DW5oKKdgnebfSAgy1WoRB0wZ8GTF
         sxtQZycVsJf5hRGFP4vqZ5baXg4kmjtEM8Z0XEacI8sXgsHdLB/cAhnM0dMUR/Ewstd9
         z0JXv7pqZPAK+Wc0twE8HCByk8ql3mb41Hcl4HTkoonQnQKFlN5wgf0hPgYRdiBMTUQB
         +OomnuNUnaMHGfCdG9bqeOTupcXhQEKGcItoCKb3KjuimcevFhB87DJdSWy1pJpbKDwO
         UQsjoHKgP1mkOnLuTTPJHFHcSm6ke6EoQEko5QcxzTaefNmEYib0joXjA7pM+PDIHOgR
         fdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756421188; x=1757025988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWTfsYajgxspjw0BEVIGAJj43TSZuMXWhqAKPxCzuMo=;
        b=cca9N5Ytr2FEkoPz1/ky0fHPVsizBEBokFzOBiDxmXtSph7TYZPEsFeopqJds8qgVe
         17hyLCxmChJ5TqlrQ4kSaziX7muplCAeDuiRBh0XzObVBV7CKqvonH0kPfUnCAyDE2hD
         R4IK+owE+Z2Cxd0LQ88Jj9vaoNGjgk10K4dsC+YaCmttyoNDHBMNKAd96S+VtAcd0qM6
         bmnFcsCLzpqoymuiecFC2L8ZXz47dYLY7hrhyWJ26cI+OpHDoOwxGNlKv427GwW9LPcc
         lU2uRomyPhaalEwWcUWI9Jl5g2G8Ghr1Ckr0Lo4mcc5dRNzWTm2IrPlKIPm35RoN8Pv3
         gxvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbEgflWQoi+jCsIJGQEUZvNVW8OviB6R/gRZLnEqLOCor0EehXmBGusxe+EjFK9IXKNiAv7HcuLiVGjusfoPpB@vger.kernel.org, AJvYcCWZaxiKrTDqEeC0lSnUNdE56yTz6JnKXnJPA7fcPVcIKB0tXD6iJycYVID0mFf/yWN41nUKGGu53t6uMdx5@vger.kernel.org, AJvYcCXLIfBCEVLY+d0FwqBd5xlNNtdJU8DT4GgHWKnmYRrMKdmn4L/XpWUPGKZXxhDpm9CoCIoBtz34Bw0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQqZmBC5rbMS00gF6JHeBY1GXWjGeokw7fwrlVT+MzT6HN92jT
	DgH7QjwXcscyoo7Svf8jcQVCW74qZZA5CjGLBumsUHhJIqnPKtmXFWgfa643PRis0hp3M92sFUs
	YIkYv3hlNIeME+IHIEXwzb0srnBH6hNg=
X-Gm-Gg: ASbGncs5BZmoGj4mcFfUQ7bAsgyEnKmtawDR3AtXDSqGjJM8M9DBs9YVUnJJsG2bDQA
	ys7kNFxEaify43i3xTVN3kMpGhPc+yxfMZiw24PKcEIBy8dV2bzCi1/+AMOejdS7IhMxvcL1xBe
	n9eGCPB6qNQZ85auZYB7Y4uFGMSYQWrGDzdgljfbW0xe0wMxq3MyohxfRDqxAUpHPAKOPIG2KD2
	zV5bN7IltGF8XekNKA+BLMaUbuTtCsylGLls0iCfl32/Rh0ND8ER+kAOqqwasR3OK2ZknmfqxnS
	xcqZ/08UadFbXpsUQ5XbJzQg4Q==
X-Google-Smtp-Source: AGHT+IEki7N5+ZTphBMAlPvPh8Ed2D0soQ3ee4I0yeC35pDHbq+VM6I/+v50+BWUjpOg7vsfojcxdwe+ytoieurevJg=
X-Received: by 2002:a17:903:2f0c:b0:248:b43a:3ff with SMTP id
 d9443c01a7336-248b43a098cmr46736235ad.8.1756421188295; Thu, 28 Aug 2025
 15:46:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250825141316.work.967-kees@kernel.org> <20250825142603.1907143-5-kees@kernel.org>
 <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com>
 <202508250834.E2456B9@keescook> <CANiq72mQsLqhpX29NP3Zm8HZ5m429tSXjgFcRYJM3e=Zac1G1w@mail.gmail.com>
 <9CCDBE93-7DBD-41D0-B9B6-05900F2AB1EE@outflux.net> <20250827013444.GA2859318@ax162>
 <56c2b1ce-00a4-403c-9927-79bfd9a23574@infradead.org> <20250827193815.GA2293657@ax162>
 <CANiq72nX7d3XQtQKDdeUh2RFy5HqSg360m4pzesJyBP+y9K7FA@mail.gmail.com> <20250828201915.GA219815@ax162>
In-Reply-To: <20250828201915.GA219815@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 29 Aug 2025 00:46:16 +0200
X-Gm-Features: Ac12FXy71Ta7noj8hoAJaRqNi-cWiWGGHMHvo9xSNtrTkaZTnVcq8IZX729diUc
Message-ID: <CANiq72mRKHunT2Zkdj4dS5yHrx==MsmY33BvBqOy52_pNqrZFw@mail.gmail.com>
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
To: Nathan Chancellor <nathan@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@outflux.net>, Kees Cook <kees@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, 
	Puranjay Mohan <puranjay@kernel.org>, David Woodhouse <dwmw2@infradead.org>, 
	Jonathan Corbet <corbet@lwn.net>, x86@kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2025 at 10:19=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> Ah yes, I reread your suggestion and that would probably be the best
> course of action, as it does avoid the extra symbol (although I am not
> sure what you mean by one less rename?). As I understand it:
>
>   config CFI_CLANG
>       bool "Use Kernel Control Flow Integrity (kCFI)"
>       depends on ARCH_SUPPORTS_CFI
>       depends on $(cc-option,-fsanitize=3Dkcfi)
>       help
>         <generic help text>
>
>   config CFI
>       def_bool CFI_CLANG
>
> then keep the rest of the change the same with the rename? I guess the

Yeah, exactly. The name isn't great, though, as you mention, if users
with GCC see it early on.

By one less rename I just meant that we wouldn't have both CFI_GCC and
CFI_CLANG "moved"/"merged" into CFI later on (just 1).

Cheers,
Miguel

