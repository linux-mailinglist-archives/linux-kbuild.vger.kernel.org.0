Return-Path: <linux-kbuild+bounces-8575-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E81E2B34514
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 17:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 640765E7059
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 15:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10A83009E6;
	Mon, 25 Aug 2025 15:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PfCYvIFn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78E323AB94;
	Mon, 25 Aug 2025 15:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756134090; cv=none; b=YTvOPrELTfjF9EEJr8g0gVNrhH5Cll2eWErurfohFy/qcApLUN1qCxcZ7JH2E2kjOqxBDBZlxcRlWTsqFk8AxUuAtIMV3xjp7sBVppphgfGHoA7OhDmL16+3vIIiUT2juzFNmGxGAnR6mry5cFOcJEBEdtytQdHuD8Azw814Weg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756134090; c=relaxed/simple;
	bh=L+GLP8NhyycYgeHZwc0fgaV7zH7hZ5ntFI5ZSTxIQKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FIqxOOiHnSzcGAOOecNloB8Y166yAxNoeGYf1VnZY6/nxN3aGZzAfT3l70uPdLDFoLAcIiWMB9dXbQBS58KcgpIN4hUHEQ+9AL+x5cDTZxIMz4W9dKgI6JELSKTc0WOtOWHO+xNiWJShzpke8UrvzUTuKJISpNWnb9mcTxsVt8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PfCYvIFn; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b47173bdb03so796296a12.1;
        Mon, 25 Aug 2025 08:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756134088; x=1756738888; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60iKAkP3LNe0WedWNS1417UnpVB5oYJPCUr+7fQ2LGY=;
        b=PfCYvIFnWbEJVwTKfKkklgLH0WLwiMdytam8YjnkWpw/f46F1esAPayFuKuZ2VJ0WO
         7XarCsMBgmnZIAqT5z9QXCGk3+PhB5oczEzfHpvVmoxosgu4yOx7cqncbT2QOWffqj8m
         YjBUzPzxL8d2u5rcKTWWkCEItwMMxkgHvjUeGI1YgJPVAt33pc5zqDe4wmPsDaZytnaU
         41FL1yiQ/3SSXZ+wLPzOXPRg5h8iYG9wbkjdtn4tWju5vvNFeN5/GXUeZfee7FLsKn2R
         H54a/K/PEFYocGI6FsUYosWpiQfFIN5m7Xtj7AFwuFwkWKGKVr2zlbkqD3VEdsjwsvua
         Ioew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756134088; x=1756738888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60iKAkP3LNe0WedWNS1417UnpVB5oYJPCUr+7fQ2LGY=;
        b=W4pnnaW+nAfbc+m9gF9gpvcGa4oajeCiqJ8xow5+V7vXfDlpR8RdnVUqAQDwUpnxG4
         3XJ0THRcHXCKSY2TWl1MzY0Aw80d9pl9UUMTkOzD5aiBZCTTx67f24wJYwbEVFH+oSoa
         0kWxTNVDG135sAb4bDRX3ChNbZinz5ssGaQpFP77m/kTQWYQ0vUlyrdRqFJ7Na0HVpXQ
         ef2ANtmbket9YJCClJoRYxwM8GNV2J8zlIgwwS/0tNNp82EuvYFtijWVc8ofnYLVxJmP
         u7Rxugxv1rIndQM+di5TO5WKFVuI3ujm0qQofIVm1RFdlZX8CS9UrjL5cObcvOrui4um
         ukjw==
X-Forwarded-Encrypted: i=1; AJvYcCUAjiVb+SaqhpstnBXuuSKJRAQjmPv0SyJuOR2x7AogL2PIKaG1lebb5IrsaT+4uHbCv+LPCSPA9Y0=@vger.kernel.org, AJvYcCWm1gjue0VVFwBdmuBO5JbF0Y255nQ39QkAZXfNZTNWRr3cPguybZMCMh6umontZ16d+RiM5xViIJbF0C+D6NBn@vger.kernel.org, AJvYcCXLOdJBcvM5GPjPasCk4gN1if1CM87YmvxuGXI2QPELqBqZLwuczkALTmqJM8B0HEzjVcZTrwPjxPFXg58d@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6R20gEtdwS/CGRPjhrMDQRbV2fLoXMZng49+PAvFkDM7NzDCX
	fpgodOYHyJnA+L7q1eYN4WunvnZzFdkNxGveDtXFZ4mKLSfFvUpW5gHlMA1jvWO51Qc8KZEmIUi
	csKEUxvbnEU1pcBqVQOJbSBqq3f3d9J4=
X-Gm-Gg: ASbGncvvDG5szqllWfnX1RPLuOoe7+vFSH2KnYY7amaDi3ZvOFFQr4cLh/NSRmOD8gA
	I4lAqx/bqNXMdNhxJINUlhTBnrvgQiG7an3zUkRPiyNy+eW9HC56EeMPL95SBJbi7ATK02WSb50
	H6kClOeovTD6Ni9IUKNzkXzAWvo2dyKxEXDlUVuWvv2tgRqOk65wJcGnoDh2uXlwbKHbmVHXgxJ
	7gC6p//gvvOrtWErynKJWrtGRGqrriTSeU5dv2YZ0jjK3p2Qd3S2wIyOQ2rF55NFgR67xRtBG6g
	rL5i0jZqM0d0MHrkvXE3hUfY5A==
X-Google-Smtp-Source: AGHT+IH6iiTQnmspwpwZFl3fWU7ZoF4htCbSAXCmYOC5YgyGhCHecWhDJChnNEZn0Tbpwb/nBEcItL6vKFF5JoBFO9I=
X-Received: by 2002:a17:902:e5d1:b0:246:9df4:d10 with SMTP id
 d9443c01a7336-2469df4127fmr48184305ad.8.1756134087549; Mon, 25 Aug 2025
 08:01:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250825141316.work.967-kees@kernel.org> <20250825142603.1907143-5-kees@kernel.org>
In-Reply-To: <20250825142603.1907143-5-kees@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 Aug 2025 17:01:13 +0200
X-Gm-Features: Ac12FXzL7PU_Is1-tccv7Hdj8Uae-cmowXNNIswc_ypx-UP0ygKjVjE1oakxuiw
Message-ID: <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@outflux.net>, 
	Sami Tolvanen <samitolvanen@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Mark Rutland <mark.rutland@arm.com>, Puranjay Mohan <puranjay@kernel.org>, 
	David Woodhouse <dwmw2@infradead.org>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2025 at 4:28=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> -config CFI_CLANG
> -       bool "Use Clang's Control Flow Integrity (CFI)"
> -       depends on ARCH_SUPPORTS_CFI_CLANG
> +config CFI
> +       bool "Use Kernel Control Flow Integrity (kCFI)"
> +       depends on ARCH_SUPPORTS_CFI
>         depends on $(cc-option,-fsanitize=3Dkcfi)
>         help

Do we need to do something to make the transition smoother, i.e.
keeping the old one for a while to avoid a new question etc.?

Thanks!

Cheers,
Miguel

