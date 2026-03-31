Return-Path: <linux-kbuild+bounces-12438-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MemGzEWzGnfOAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12438-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 20:45:05 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB81370257
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 20:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7A3BD3001CDE
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 18:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2075E331A78;
	Tue, 31 Mar 2026 18:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bBfOLv1c"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8175038F249
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 18:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774982667; cv=none; b=lm9GP2+Q1tXww4L8dnFHvtDFRUqz8++OmJ6XncOJPk7xYFR5bArECWeHSwrYGb7hhXOWWG0FZr0CnyK0toPCO3jsF6uJ4zHFAs+qxOI0EdB4sNRtqgVXYAu1DSXWOXGaCkTgrgBdj22+c7SPCK0uxraqhGKDnd5F/ZCuAEt9YXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774982667; c=relaxed/simple;
	bh=DwEKjICeDkCjJOVrt0+LZu6p2US33YhraP63lKerfiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sVxWcTQxZkM86Edm+QNeUfz/OtwDxl3E2wmZtO6F0d4rC46tOROdY7ppdiEEDShJEFatB8vT+AiK9SeY1+JSEoFRu8RqcYahs7Ig9DWQSDY35ue2QVD3+6DbVimSkp/6JxlgGHuNGiyjtWQMGtkEiBleySjQbfgQ/DnovHYU90Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bBfOLv1c; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59e4a04f059so6190603e87.2
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 11:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774982663; x=1775587463; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6Jwbq+7LR0mSJFQk5uCurdhkOuVoq3zAKj7b6at5J18=;
        b=bBfOLv1cC1VYwG6yeiUsXxWQETY/5KW09tM/a0oXWjPVkIXoAVwqdU9SbBZPzmX8cr
         xVklYB9+BLkIfhyhBIVacF7UlvvIfqu4oNZid0iC2pbdBV1bXdBDbiUv1LAZXjFDat2V
         BgsJmacb0SIkPOsSBygKbwpAj+MiL2ZOXR25E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774982663; x=1775587463;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Jwbq+7LR0mSJFQk5uCurdhkOuVoq3zAKj7b6at5J18=;
        b=n/2BU6OYqlfMPfgLRn44dr9beeFHrWCAqbNiCfuMiCd46aHHEXcvGYxHeF7LSlN0UY
         Z9lnxfV8l3lA/8WspO5GI8eqBPJdyRfP4r0y8IiWmuUyv5bpkqfF/PgxYHZTf6jGHcYk
         SBOwpk9WUKK3/1XZD2/Dak2cH0Hqz1lDPMbvWtQD52O7f4mhAe2gu/KnhAFWIG7HOJd0
         rTtL2tBwHsWNqKEZdlYg7j3aAl8WrMRz0nFhSKwtpQuXDNTcUKjy40iZ9/eP047OLLhk
         3rIb3lxS73H7Wc6ruI5EPq5hDb/qFgtrt/q1SyGUfzAqZnLhW8Ij/7YOTqNKwgrQgQA+
         qDww==
X-Forwarded-Encrypted: i=1; AJvYcCX56xPkd7RlxX3cZcZ/U9iHV1D78UzC/g188Nuxwj0pLHyrUme2pY5RygLADGO5JEpS4rNhrYLngk8lVaU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpI5IE+P/++KrlqxKFECRC1V8nMv94mnGyHqteq1Ew5CO7G23/
	9P8RyzUFrmO4KQMuZG3D1qXMVOkW6f63S5JEymXDlSc5m16oshwjxYul/YMF0YgWI70N3CGlr80
	TH/FOt5O4pA==
X-Gm-Gg: ATEYQzy3eOj2ppqr5JCoNhX60ArPJl9paKU68oF0nL9R2+pvZEcCsQ89mLNWf8jeRAH
	rcfRNpF50rDrj7dnotd3GA2cmPQsIoEiYkziQI84/LMxxd7atF9Gd01ekoRLVsH1kFGt7wyd0MM
	FafX2U/7+dQVorm824dy/NvFCFwfVrv7VAMVI7I2CNgd+FB+kJu/0XuqNRGmL/hYmlavi4Ne8ZM
	4xqkLiJ5i10Qd+YbBKbW/KCDBAO9cB08Kegb6XkH2UEqpuq1FLBdnekgorAdMU9v8yvIV2YoPl/
	/s2Rp1rQU1HjJlK+XAXoWKISS/0Zp26SjcoT0VL5q9wRbYm/7fzfd/FGeJWlIlO38oPm+OTILBd
	4y3bUCCZYJdcuMoAJCRnKwssJta5Aw01saL4nnQFT0K6AXMU2ABa0fsWqwDHXfkqGhf1I5TEKKc
	KDxXzod/u4F4Lsc+zTJZ6AFMou5BL2TBsim1hQqqktuPIX87gKaxExE+X98mR2jz57xsYV2fO1
X-Received: by 2002:a05:6512:138e:b0:5a2:a24d:84fc with SMTP id 2adb3069b0e04-5a2c1f19528mr189969e87.25.1774982663487;
        Tue, 31 Mar 2026 11:44:23 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1455323sm2634887e87.62.2026.03.31.11.44.23
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 11:44:23 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a1307438ddso6600262e87.1
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 11:44:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWz1/ac/2BXs/ErlnEE/8iAFu+W39MHjpzmlfDBgRmphx1rDmasxPbKRxRo7TsNQZRjxgV0m/4vOxz4dhc=@vger.kernel.org
X-Received: by 2002:a17:907:c789:b0:b97:d126:c007 with SMTP id
 a640c23a62f3a-b9c13b2c4a6mr48468766b.30.1774982192841; Tue, 31 Mar 2026
 11:36:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
 <CANiq72kL3rTKyDNYmD7wXiKCVJSfa1bnp2L8NShXU7OPmWjJ4w@mail.gmail.com>
 <CAHk-=whjwHjmB0_2yXsOjDa7Mi_yFSx3AMd3vGk5r70WocvZZg@mail.gmail.com> <202603311117.454F578@keescook>
In-Reply-To: <202603311117.454F578@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Mar 2026 11:36:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wizJdr1qgJ9NKNjtbH=ugL3umA9JRW9ifrQaD+PpWCMuQ@mail.gmail.com>
X-Gm-Features: AQROBzBUflXPh777BM9crSo8MSIUJXluDEJ78_cVjfj9YSXDGlWfMakjxHiYmFw
Message-ID: <CAHk-=wizJdr1qgJ9NKNjtbH=ugL3umA9JRW9ifrQaD+PpWCMuQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] types: Add standard __ob_trap and __ob_wrap scalar types
To: Kees Cook <kees@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	Mark Rutland <mark.rutland@arm.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, Finn Thain <fthain@linux-m68k.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	llvm@lists.linux.dev, Marco Elver <elver@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Nicolas Schier <nsc@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12438-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,infradead.org,google.com,kernel.org,linux-foundation.org,linux.intel.com,arndb.de,arm.com,linux-m68k.org,glider.be,linutronix.de,lists.linux.dev,lwn.net,linuxfoundation.org,vger.kernel.org,googlegroups.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,renesas];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:dkim,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6FB81370257
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 31 Mar 2026 at 11:32, Kees Cook <kees@kernel.org> wrote:
>
> If the code was written perfectly, then there's no problem.

My point is that BUG_ON() DOES NTO SOLVE THE PROBLEM.

> The point is to make a type that still works with C and all the associated
> APIs (e.g. format strings, native arithmetic, etc) without creating the
> mess that Jakub, Peter, and others (correctly) balked at around accessors
> for doing function based math.

Has anybody tried to suggest that "use a label" model?

Because I 100% agree that the current overflow handling is pure
garbage, and doesn't allow the code to be used in any kind of sane
code.

But I think that's solvable with the "branch out on error to be
handled elsewhere" model.

               Linus

