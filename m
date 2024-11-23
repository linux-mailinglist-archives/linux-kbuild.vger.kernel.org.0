Return-Path: <linux-kbuild+bounces-4822-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B259D68D6
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2024 12:23:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15595B2175B
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2024 11:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBE9187325;
	Sat, 23 Nov 2024 11:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QX7zEFi1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1910154BFB;
	Sat, 23 Nov 2024 11:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732360995; cv=none; b=PHhDeKw1xgRYDkyGTHJ7zPRzNXq1u+Tjmjkjgtdnoy81Si4u5AXkGVkRGP7vdIBxItMiOGuGLqXpmrGsURKufFTbl17s0S3vsP0M5b57WbTdN0ZCoxgPPGBOstOkW/XgfFMnKG0FONGqHylGEYXv7iirROTYKnCOcW1h8O92ru4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732360995; c=relaxed/simple;
	bh=u/EP1S+viKGpmTrQ8yI3KxsDbuyUkdLIpl2IkM7RyRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kBpa7UWWk8zDD03ZP4s+yrxXkgjstWBwECKQNSwwCtYNqGyRbp5H9sKFYScuDKPLio6QLM5uvAYWqAl1cfL+K/86XTt2Q1BHBqDaIYRRLlCO2Bp2WXatcTGdorzV7Xa9929zizSl2UC5ph3hnHJWpUv2g/e+L9qlQAbyyw1mfa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QX7zEFi1; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53dd59a2bc1so1783540e87.2;
        Sat, 23 Nov 2024 03:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732360992; x=1732965792; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u/EP1S+viKGpmTrQ8yI3KxsDbuyUkdLIpl2IkM7RyRs=;
        b=QX7zEFi1wFY/uD3jkok8lfHTByJ2aNleRCbOXvNUXvJHNNNRYsDSMeXIdtuXwJAl5H
         nClVUwKKIYQKFNoCJIpu3wCP0AXoxObBLiaQaIJcISuGAZF2E7Msmfu00u/kkAdGZEOP
         Kek8z4DaMshzkmnfzMw8zfvT5/YvJzp1iDp62P3h8tSJzIGEwsTW9H8ne+6dv5h4YkdN
         PSE+vgkjr7EbMNka536HxpVfB/WPVb1zJKmjg3JpZvtZBR2M8aHKkOa1iLW+txiUyvOn
         YcRXU+vP/ieIovXgVbWIki1lEajZNH3icl72OKCEEu6KDxgYODb2GDf7GogsL+ucGZBd
         aSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732360992; x=1732965792;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u/EP1S+viKGpmTrQ8yI3KxsDbuyUkdLIpl2IkM7RyRs=;
        b=VnWZW6pZuZWQNJJR/66h/ZzuHFg9ecMJyX4ZQivpDkbRzbvZusWFiGEDuyPx0EuMzL
         7oq+nS9tyUbhyd1L6SZiqR6lQjpafXx071+y+WlBnBu2/iNVAvUFMYJel5VrHtqbIgaT
         RC+vEjrP/iijpYVIGhVNX93MCQHssE5+XjSVC24IvNhiqj1DIL6QDHr7KtV6anJgz5Lo
         XW3Nsy4VgPq6tW1no9e7Cft1o3mW/lm0RDp4rxp3mCZ0CU7Qt33s1zMYZcw3a6brH6tP
         2j4Zs3w9Ok7J6PGc6BXfgOeC6w9H9EfZuUBK8pwlVn1YzaUjZ/zjz2bKCafuyfxs+yuy
         yfRQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6QY6fpqRdXGGTKuOqIh2PtKWu1xxzrEaXqIalaaoXE3zWA/29ZRiU+4FE1PhIorYEX63sgz/CUwGQtDzm@vger.kernel.org, AJvYcCVtZKJZGHM5uSNFm8WeKH0MEREdvBj2zoncN/H3V6y8CXf9e/opkLvJhrk5Pl/FIEQ6/4ZmRSBdPgTPgSV1l0o=@vger.kernel.org, AJvYcCWbb6oXiqwXOl2f2nQdb6dzC8OBqaJMBe1eFoI2nhItdbCfQiz5WoWc1SCUWRrvqXQrFiF3qqlUhyv1fn1fYQ==@vger.kernel.org, AJvYcCX+ZpqOv+UcEnplXjzvJasIE+6Am8yEc1CJAc79vtEwDXmTN0n+I9UkWgdduR3n4dA1omPjCug3QjBq6gU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP0v6rC+5+Sk+Mlu8v8I4wiiTMYdP8Docgsk1WhCN0vl2BlQbQ
	mVMA1L/WPUNsK9/snrgMm/XFj8Cs4z/yGCqEwyHhvKLLUEC6VNKJvATziz2Dy9HIVLrx8ftRXVI
	+5SoyeuBdB6DT3coQKJU1Lo6lEts=
X-Gm-Gg: ASbGncsGFGgpLICVdo4Eo6EmRAO7tv/8jjdPNXtOwuk/NYIaCuTafdKBxwMEw8Q3cf2
	q3iRPZtue1ary66qu08+sP3Y6xphpDTm4EX+ej7FDgOsqzCgFFbXZvaBq2NNJvg==
X-Google-Smtp-Source: AGHT+IF0iUq4b7Ych9A6xW9HMPkRzg3eqN5Ybs8vt/ejefOR7PyZW6CtBCOharUBfJO5wJ8zXGhjtReeIFOtxTdYdEU=
X-Received: by 2002:a05:6512:2391:b0:53d:d5be:4bd9 with SMTP id
 2adb3069b0e04-53dd5be4bebmr3155701e87.22.1732360991729; Sat, 23 Nov 2024
 03:23:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com> <CA+icZUX-gf8624z8u+h-W8KeddCruYDng-4vTggNGwC61NzfNA@mail.gmail.com>
In-Reply-To: <CA+icZUX-gf8624z8u+h-W8KeddCruYDng-4vTggNGwC61NzfNA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sat, 23 Nov 2024 12:22:35 +0100
Message-ID: <CA+icZUWSKygQJNiODzdauNiHz2Di-2eSGGmd-fgBrFpdyh_HgA@mail.gmail.com>
Subject: Re: [PATCH v6 00/18] Implement DWARF modversions
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> BTW, I am testing with the latest kmod-git and pahole-git.
>
> I will give this a try when Linux v6.12.1 is released.
>

I have a prolonged build-time of +22,75 per cent.
Compared gendwarfksyms-v5 + Linux-v6.12.0 VS. gendwarfksyms-v6 + Linux-v6.12.1

Is this a known issue?

Best regards,
-Sedat-

