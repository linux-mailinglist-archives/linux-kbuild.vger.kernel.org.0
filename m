Return-Path: <linux-kbuild+bounces-8103-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B5EB0E178
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Jul 2025 18:17:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBDFF56367A
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Jul 2025 16:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 381F327AC32;
	Tue, 22 Jul 2025 16:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FePCoxXH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4045E27A103
	for <linux-kbuild@vger.kernel.org>; Tue, 22 Jul 2025 16:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753201033; cv=none; b=lqporCgd6UUQEPAO5R1xyioFLSwYNXoMh5ZOYDek3wa2XoQJelEWPAYNjaCCNa/3JNW7VZD9snQrfq6Yfk4VtHOjoskxbOQFlrrn6tw4PhVai/RFKCv9OKzBZ5hvP14siutfEZtpiBJMK3Ldw5W/ypw25r709fdmb0aQoLUqcgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753201033; c=relaxed/simple;
	bh=FDXlr7W+/66QOFftaHFQrLT51jF+Ev61+zYZLRFU49U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J9VzVJXXNSLb2MK7TBYy0vJQG1FtOYrJBKKitN2xV5VmyoHJM2NH0lRH4S4BZhek+//d5LP4n28sd/O6k7U1+d5R5giOxSB31ibyykIK0V1v4C93+8OVJixwo2fGujrzD9di52lHa4RbZYImeGvWphAvS2wfb8dsRMHaVUMD5hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FePCoxXH; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60702d77c60so11029369a12.3
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Jul 2025 09:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1753201029; x=1753805829; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MwUpVzSwK6dKQWrESREzqGXoWD+c7JZoygfweu86bO0=;
        b=FePCoxXHflz+Xa7ML6fz5fmq0+45iPmkB6LpMVy0iNI0bKIq8K9ifQC2FSyWqln2x8
         0b2A72nHVRLJNQfUk/e4o+yeDxKDvxTdCh+No98OecloPxPEa4Yht4qneioqbWLU+gzt
         YGf5zZrtRS+iHMRuRwN4uFev/aeyUXP2K46S4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753201029; x=1753805829;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MwUpVzSwK6dKQWrESREzqGXoWD+c7JZoygfweu86bO0=;
        b=ej/Dp4WLvnBFa+j8T94rA0V7lK+OyEft9QP8JaKHuLDgOJFrIG0ENJSXg8cZYaBXt+
         Qa5CiIR38CzoCl4bLr83hu0JQ9aTFoSg365IQsEmjHGloBFAMi8PyktcVipptUQF+aFH
         8eGU59MBhW0tc+aoCc2+zQCAR1c9NdatRQEFgyMCApNi8IaGJ6NP+QRimZbSHFgNrZXN
         X4mr5sfhjWCqqcPU02pEmDaSO4CbAQYLd7l4aT+DWRyGUo/CgG6x/R7iHN0wwjZ4e3zB
         u2SZdZho/9RI5V9QJal2pjDg6hRYq+JAL3bfnESiLsSlhPPs5y1NoP0mgf0hMkLka5lA
         /vnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDM0Gg0agGeanOKk52nSQAIE+yVcThEIRQgZn9Qw9wxAApVxYYLmm1RIsjj1LR2qHr1Slf2rArwfiIjw8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTJ+CCcj5DtIiBBy2oEcgw2Y4s3okr2BesimNNfmW9KHNczWnM
	DrWAywA6vJs5/V1GiENisjJaSTCGXeV4FfDrmlPA2Bgxav/kcQSEW+qwA4x25Gj24fHM1edZg8E
	YuxBr
X-Gm-Gg: ASbGncuxT7BuPn/1Ww/7ySJ51Z90Ec5zm/cU3XuS7I1ALCcwxzqP++ziWJIsbHwBAoE
	1lp0sMmfPj0i/9ROQEAXOWbNeWf5b1tV/b60ctP1ZcJ2rQdqfQ0tOxIzx9ZENDDjoCG3bnkX7tk
	OcW/q6dRd57XYyfBRoDW2UOcELqq/JA2M5+fVODqMhjZR0KG2VAv68WxiXVNp2hq+pzL2J0rpq7
	1uVpGNXyWoLeL2fPQYQIrLcdYFoGtnUzuEsUmCQQ7h8ITxZ9xSIZzopzKQAAkHQo5Qhrq33yh4Q
	I4xu0FavnQFuE8WO23HRueRHmO6NEMqFtIxgHlWskgKpAQrILfy8m8ek5FTwZHFqs86xBuSbUP6
	MoiNLyYiJ1UAU2xcUNS/XCiMa2K9bt0xyGw9r7ZK+ZstAoEANC1mz7aQU9hAEKSr+oHrmR/MS7G
	SfsDrAFuA=
X-Google-Smtp-Source: AGHT+IHQwUpEABlWYkl+/wyI7K74ar4xARocJFIFT7xrJll/8a3CHm3HSlJ42fp34H0J8IKs8TEKHg==
X-Received: by 2002:a05:6402:361:b0:60c:43d9:d075 with SMTP id 4fb4d7f45d1cf-61282143029mr18331990a12.13.1753201029215;
        Tue, 22 Jul 2025 09:17:09 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c8f0a0e2sm7231240a12.4.2025.07.22.09.17.08
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 09:17:08 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60c51860bf5so10007377a12.1
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Jul 2025 09:17:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWcndqGzT6WlGWH0ALFPZjdohVnSGNff8ac4yVfGvcVMxNPCqpqSnp+G8OSEspjmqBUTTwP8BoasovXqc4=@vger.kernel.org
X-Received: by 2002:a05:6402:2111:b0:612:ce8b:8e3a with SMTP id
 4fb4d7f45d1cf-612ce8b93famr14784723a12.18.1753201026121; Tue, 22 Jul 2025
 09:17:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722152053.343028095@kernel.org> <20250722152157.664260747@kernel.org>
In-Reply-To: <20250722152157.664260747@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 22 Jul 2025 09:16:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=wihb6KVgU__zfhdHR=-Mqhp6qaAABdu31CJ2ML6MDj0dw@mail.gmail.com>
X-Gm-Features: Ac12FXzcgZHEVpW_XghiBSi-6W6yHtnaI5_N4MXF70P1OCTvgMWBy0XPnjswCTs
Message-ID: <CAHk-=wihb6KVgU__zfhdHR=-Mqhp6qaAABdu31CJ2ML6MDj0dw@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] tracepoints: Add verifier that makes sure all
 defined tracepoints are used
To: Steven Rostedt <rostedt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Jul 2025 at 08:21, Steven Rostedt <rostedt@kernel.org> wrote:
>
> Add a verifier that injects a pointer to the tracepoint structure in the
> functions that are used and added to a section called __tracepoint_check.
> Then on boot up, iterate over this section and for every tracepoint
> descriptor that is pointed to, update its ".funcs" field to (void *)1, as
> the .funcs field is only set when a tracepoint is registered. At this
> time, no tracepoints should be registered.

Why?

Doing this at runtime seems completely bass-ackwards.

If you want to do this verification, why don't you do it at build-time?

            Linus

