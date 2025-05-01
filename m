Return-Path: <linux-kbuild+bounces-6849-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 917A9AA6768
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 01:28:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B5D99C09A3
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 May 2025 23:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751C0264F9A;
	Thu,  1 May 2025 23:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="M6GxktXQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301FD264FA5
	for <linux-kbuild@vger.kernel.org>; Thu,  1 May 2025 23:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746142128; cv=none; b=pmuPOUB0GPQDi5e6lcDlsHvmICPY1d1pDoKf3Gt2B8geGDLinkHHUn+2iyJZvN1e2hljjFNgz76o3ilYgGIPl6Hwn4YfqYpZFpI9obYadI5zYFfoLmkLRkq5TrJJOzTzXgUWxe4jtIYgGEc3AFrZJrVmpxiH2sRKJKQbwbRp+zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746142128; c=relaxed/simple;
	bh=TVZv1wE6IMiopn+lPutQ2XmVSkz9PSPheYWfp32DhNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d8XrbIWONEoIs4YH8Rkj9UJmHN2SGc0ZGebwcU/6RTPrBtMcK85w0AurvlD6I/M24dfoX2elDJ3DWmpB0i80xwsJjTTxlZzsZKWLquOVbDsKVKwJvA8V6jJc1Q3PLJts1ODPvgfG7MRdRV7J3rF3FlJMX9CEEdpEh224gzxRdBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=M6GxktXQ; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so2315595a12.1
        for <linux-kbuild@vger.kernel.org>; Thu, 01 May 2025 16:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746142124; x=1746746924; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xLQxE0ZAajilS9LJlCgVNxjKesNL8CM31Y1I/hwFDe0=;
        b=M6GxktXQrD0FA34AJcO7UD3d9tqJfcwQn0Ldkr4laJO4fFatRsaJkbzarQtQpvAcGb
         nctTJxPDjdxfWI8dPSHFr8bQB2AR1I9TPJ1DJpfvLTEAimSrH4J4+dvMb1YUiSNF8fnt
         V665tcJ+GHghOaxT8tlkRGT8u7Vw+VFqsAD1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746142124; x=1746746924;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLQxE0ZAajilS9LJlCgVNxjKesNL8CM31Y1I/hwFDe0=;
        b=FRkOFCJkjkCosizzHU+7eQdwczod7YqgR46CaSk1tco/7r8T0nL9+BjB11n1FefRAb
         ex3wTQhcZS0sXC/tKhfW7jedqkUtzPn1As8F5pLR3AqmsHgxEJNlwnWI3lWR9uHyKhwP
         Kc46T50LbfKkNHerQ3rUuvtB/dpTOoW/IGod8Moqm+fi7vmeMZFYksmtH5DAwUC53lYM
         ZE3/NJA8NTDD9mBvEqKhV3CfknqfkS1/y8dHA/MWFyYZt5qXrllVfuAZaaAyiAFeKmga
         RzDhCGa/eYqrDcgOddpr13nXmryqidVX+aN8uR0UWnV5iZWzuLEK7Ed8Zq88cSEGy0UZ
         mxuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzWVQdxmMbx6gBZX9OX0/CFlbYPFBtehfyl2gDySWXi2+txaAMJ6LlwNM1Zyz7vz6AnTkrf7PYWx+lV10=@vger.kernel.org
X-Gm-Message-State: AOJu0YzisoOxrMIzSnMqAKqSQZnzxh5dg4Oi8jSphK+syZUZXY36Iiw4
	WtXCDXGU64VV/nzV4PyIhiOENNW5j/4WevVz6tEfhVHHvWySeL0/vdj+Rp68OTZlx0XuL4xy1ZY
	GNAE=
X-Gm-Gg: ASbGnctfg8eWxY057jLpClKzGO0pO4/ESlZJ1Y5KonGwp8mttIhlJceogWHHnRimkoc
	U1g/qvZwbWw+3R1PrYd7Fscox7LA1UiHfaj/iT983k708IMXimpRlb+aj4rRtfMilUrniUAST4L
	3zxDh5sISVc8KPhJfeaVqxjHp+kQ2jQt0zf3/+69tlsY1v91D+mwwNiOHRzKKpZGrrGMrOLn5wY
	I1m3OLePMG+KPwn4Gt0c0ew8Mgv1mdpAdShKnPpcAS6J3SD+dla0b8y2xAx0sV4Qizh96zWSpJ7
	MQU3Q9RPn+BcwKMhuAJ0rMV0QO+GlFTDFqZ2cmnvaDa0uTifP5P0/pi3+fRgN7Kebzp5B3FmcHK
	3yFgUTMTBMtrh4zA=
X-Google-Smtp-Source: AGHT+IFRdsbQyFEqgRsYtF+XuBR+lx4xel118wPvZ8lkNcr5OTexU/b1iyFRs7vpWzuAqAp3K1YUhg==
X-Received: by 2002:a05:6402:2688:b0:5d9:82bc:ad06 with SMTP id 4fb4d7f45d1cf-5fa77fd79eamr504156a12.3.1746142124101;
        Thu, 01 May 2025 16:28:44 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa76f3b9e6sm298860a12.0.2025.05.01.16.28.41
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 16:28:41 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac34257295dso232988466b.2
        for <linux-kbuild@vger.kernel.org>; Thu, 01 May 2025 16:28:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV4FA5lZQ4wPDg4YK2KJ0hSWHRyk/llzScSIpKWsZ1GN1zdazYUW6YCjohXZ/cZvyq8xb9fefknra1i5RQ=@vger.kernel.org
X-Received: by 2002:a17:907:86ab:b0:ac1:df32:ac27 with SMTP id
 a640c23a62f3a-ad17afb8ab0mr88710966b.53.1746142121345; Thu, 01 May 2025
 16:28:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501-default-const-init-clang-v1-0-3d2c6c185dbb@kernel.org> <20250501-default-const-init-clang-v1-2-3d2c6c185dbb@kernel.org>
In-Reply-To: <20250501-default-const-init-clang-v1-2-3d2c6c185dbb@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 1 May 2025 16:28:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=whL8rmneKbrXpccouEN1LYDtEX3L6xTr20rkn7O_XT4uw@mail.gmail.com>
X-Gm-Features: ATxdqUGTUyHgnV_iTiKt6DDkeUKklvk9V4X7Te2h_qX7brrmy-_kNjuWcrlAGLY
Message-ID: <CAHk-=whL8rmneKbrXpccouEN1LYDtEX3L6xTr20rkn7O_XT4uw@mail.gmail.com>
Subject: Re: [PATCH 2/2] include/linux/typecheck.h: Zero initialize dummy variables
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
	stable@vger.kernel.org, Linux Kernel Functional Testing <lkft@linaro.org>, 
	Marcus Seyfarth <m.seyfarth@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 May 2025 at 16:00, Nathan Chancellor <nathan@kernel.org> wrote:
>
> +({     type __dummy = {}; \
> +       typeof(x) __dummy2 = {}; \

I'm actually surprised that this doesn't cause warnings in itself.

The types in question are not necessarily compound types, and can be
simple types like 'int'.

The fact that you can write

       int x = {};

without the compiler screaming bloody murder about that insanity blows
my mind, but it does seem to be valid C (*).

How long has that been valid? Because this is certainly new to the
kernel, and sparse does complain about this initializer.

So honestly, this will just cause endless sparse warnings instead. I
think disabling this warning for now is likely the right thing to do.

                Linus

(*) Yes, the empty initializer is new in C23, but we've used that in
the kernel for non-scalar objects for a long time.

