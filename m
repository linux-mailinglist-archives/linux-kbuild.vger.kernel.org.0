Return-Path: <linux-kbuild+bounces-9432-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E96AC3B8D2
	for <lists+linux-kbuild@lfdr.de>; Thu, 06 Nov 2025 15:04:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 931CE502241
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Nov 2025 13:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E6D334C25;
	Thu,  6 Nov 2025 13:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKPEwIRA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C552730216C
	for <linux-kbuild@vger.kernel.org>; Thu,  6 Nov 2025 13:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762437464; cv=none; b=Cj/RNuvj/qd6HF77XTKLWUeOBjiqYBvAzh/Ybp+e1gowqFeYNrTkXiZgZYxVgFhHmiL51VwIs+mKI/4W2zBmYPrS0kindnQHx/bS7wArZt8EH33qNSAoSSlRyaXTuvZfv3osQUfF2PscNEoI8Ees/BRROyZ2LjqBoJgE3EqUSLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762437464; c=relaxed/simple;
	bh=bUL9CATlSKCEFp9SchPtm2+vj/Y9WiYH7wXBHCxt2fE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nlA9b7AcGVQnWWsjUWaOKcr+f46xgSqVh9H2/cduj+68Fzpqk/Vce150RyU+dDDS9FlT4cO1PMqHvcbBpilTeq8y6Uhj55gmq8hD3/fYGmTxw9WfCJCwWSO9A5OvOatDalaJxnZZtASgqlSMR6JoyVkKX8W12JWcdys1+AidWfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LKPEwIRA; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7a2687cb882so118219b3a.3
        for <linux-kbuild@vger.kernel.org>; Thu, 06 Nov 2025 05:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762437462; x=1763042262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bUL9CATlSKCEFp9SchPtm2+vj/Y9WiYH7wXBHCxt2fE=;
        b=LKPEwIRAXcgo0WUatz2FJwXHuzJR84+959Q2PsTzhRDesNq0l5VC2crRTDpgK8TyPb
         ojev3/+4mMr4mdMsq34AasGyEx/tYa8rGO0D2J8Lhw450Qct6Srr8qfdWrXcG5aSF9ue
         4YtCupyd2LdQFXIjRSs6NU3qvWaUuLtqFR7g66G77bWNT3H7zJF6Q3qz8ViVhdp9Akf/
         NuP/ojSTWmPTAvaC+to17m7Sdld7gkIiDeHiWeqdmCzyeMM28dqqTor3kPi0bQMKXPOZ
         gl4qY4uJMdnMSgjWm8N/7AMJia5LritAQxUH0yHxl8g3CIK0gt2rOn9N4cG9qCCbW+D+
         z/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762437462; x=1763042262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bUL9CATlSKCEFp9SchPtm2+vj/Y9WiYH7wXBHCxt2fE=;
        b=hT8OFPiXmVSC/Hjom3VbdV6k9cYYk2zxNLl1Rw0inpxc05dt6AboiQh65p7ZTIqcNt
         n1yWxs+avRJLGVOru/AAkQ+frIku+5dz0WGHdP4BeGQMKzbk3Sqx7ram0C+lZHgLSjZ1
         OTD/6lsx/IcemWVYFj5BW4K3CaVwHimsvuWJNQih86V2s4833bP+1iNPcLas4TDgJOfp
         LiHFkmTOKvj+G/z7Muv1OklzwA/WxiSDQb3yKeKXhXZJ7dP9NDduAzXEiWMherfIfVY6
         Trh1nGPgghKZ0F6G9/VrQPxWwoh3he6/SVm9MhT0c/6h5F8rp9WtTlQXMNn33DhA1spY
         OtXA==
X-Forwarded-Encrypted: i=1; AJvYcCWb0qETcZBmVkULEks+KgmaNX9bnA3kQTRIlvC1yiU9/I1M+dDhOweOG0zZVFX/t+SSBik7kXzLtb2On+g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhh9Z/sjxVEZYnwpNnAKWKkY55HiPt6Dq0naIs47SbQvt4Gg6J
	ktIH7SzJK0QXngwn+j1vsszQrazp69rnko5lam/dSv/C6GpGN3SabY7xZS5jLu3HqwnLR0is8kO
	vsJ0j270BSyHjYcpgD6eqEDjz+3IiJ70=
X-Gm-Gg: ASbGncviWz5EfSlkFfzYnbmKcrjIJqgxDSJWcayeLLbm4xFrfUUiOKUFQg/ZRKW5Vls
	JkSpl/y3yjgJEuYFxshW9rUQtEqXZbfOcjY+IZxF65cHMb++fCbuwQVE8faWiVYwnnyK1XpbtCQ
	pG9tsICYpT4/+ce8X5OIGtcYwbeokV2f54ilYB8DxwCQ9sshIejjDEr1bI5e70DrpT60x+KE7cA
	x0zm+n2+4NIY7msohe1NauuL+TH6Decx5r5OV1BF3XRzH6iFkF17uArf6q5vHrAp0f+avqUk0Pl
	//fgpiXpN6gOEJpPnma55xL6Be0ncU3XxVOx79jLZxbGc8rkHNY9P6w2F+DgYCrfvh5VjmTvJ1L
	qv5669nnLfA5yjQ==
X-Google-Smtp-Source: AGHT+IEfIacu7s6ycCoXlIjtrZumJqQD9mwD7KRNq1JmFtRpawOaWyWJr8khm/TbVRECay6vyiuPhyfPEI4cfE8PXsY=
X-Received: by 2002:a05:6a20:3c8e:b0:341:fcbf:90b9 with SMTP id
 adf61e73a8af0-350f650d87dmr2226863637.4.1762437462015; Thu, 06 Nov 2025
 05:57:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b8c1c73d-bf8b-4bf2-beb1-84ffdcd60547@163.com>
In-Reply-To: <b8c1c73d-bf8b-4bf2-beb1-84ffdcd60547@163.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Nov 2025 14:57:29 +0100
X-Gm-Features: AWmQ_blZbO9Jzsw7nDP57RH9_Ct2efcf_gJ3fIi9rJydGF2_Lre72Afjk4gaiDU
Message-ID: <CANiq72kX4Yep3pNVq8Ge=txQbPnMO=zKsci5cPgz5LDS=D6NoQ@mail.gmail.com>
Subject: Re: Only rust/bindings.o build fail on rust-1.91.0
To: Haiyue Wang <haiyuewa@163.com>, Sami Tolvanen <samitolvanen@google.com>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	linux-modules@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 6, 2025 at 2:08=E2=80=AFPM Haiyue Wang <haiyuewa@163.com> wrote=
:
>
> Strange thing is that ONLY 'rust/bindings.o'failed. And if I add
> '$(obj)/bindings.o: private skip_gendwarfksyms =3D 1', rust build
> will be successful.

Thanks for the report!

Would you mind copy-pasting/attaching the your kernel config file
instead? i.e. the `.config` file (the `rustc` flags aren't the best to
reproduce the issue).

Cc'ing Sami as well.

Cheers,
Miguel

