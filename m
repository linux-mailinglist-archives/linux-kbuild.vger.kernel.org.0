Return-Path: <linux-kbuild+bounces-9447-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A08D4C42411
	for <lists+linux-kbuild@lfdr.de>; Sat, 08 Nov 2025 02:42:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 91B444E7D2B
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Nov 2025 01:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA9A829BD95;
	Sat,  8 Nov 2025 01:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3A+kAG8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613B428935A
	for <linux-kbuild@vger.kernel.org>; Sat,  8 Nov 2025 01:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762566132; cv=none; b=l+KQYPylZw+1WV+gYhTwgwLbdyYmz5TocR78LBEAeRCGqrcvhIbH/L7DsoKR7k3/KasNKn0ljehyrQAc1G0w3srJMLhPGTZNwn9qFGVJuQzMgfIyQ1EAFtjMv5pyDm4baWWWOvlpQYHh8MBruCAtBUVizFeRh7BET/Ff2iYwI6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762566132; c=relaxed/simple;
	bh=3WeD8Dmnp9s0W77pKxc8e9Dgz2UhqJOcVyjDFyEoOoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eea05qMQldebMCdKle8ZJbVYYMPsyJc82U47+tn0UCzXCaSHEQSJo5idBiZ2WK3H150VMXBmSTvd5w5WfG+D8HoSJlGPvpHf5uD3oghaDrn6A1HK6aDYnNypmYKlV636vpZl63or1BbULNEJ9vmW4TArfchRJ0ksswDF6QE4eeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3A+kAG8; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3436b2dbff6so62980a91.2
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Nov 2025 17:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762566131; x=1763170931; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQh/QKgqiWY0F/kYR0/DGTjHf4GdskWgqiVXYEvWpmA=;
        b=K3A+kAG8+6llaTZn9u6Gjtdnse6Z523u0yR53Dk5f5J52Qes7XoDSciq35qZ/NAJuH
         teDQVKxC8qz6ai4K/uji9IfR8JQCqU9SKU1ihXuKl6R/ezLusVLHN2CSowcuFpCrcFRM
         SVtSOqvE3yZCQNYqruewxSLVoTHbY0mapTKNS21Nbd6aR8hhhnfUesnHoR2t/cpGz2pd
         H6rlAbasZhuCs/QMHhQDoad3PPB+zV9MtBhVSo/pfvW0cU+TsY6koXBKb94clfHtnLBW
         AlXU6VLSQt3tfXHIvfKlil1Ml72RyadxNo+D0WFnnUv01IKxj53MX4YpeLbZYKzNpstH
         DhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762566131; x=1763170931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CQh/QKgqiWY0F/kYR0/DGTjHf4GdskWgqiVXYEvWpmA=;
        b=D9AjFHXR5bVW3lrfQ2kffdvB1qdiUnTEXMZ6H2koiAz1JuFAv2rh7sPZspmzSfAYuD
         NyBI0FYSnXTyTAifkJhzTxARiP8o9SujM4hQnqfmLJLARXfdvBWwvyPxsMgl+RF10DoC
         rGIfUXBKptDGxKJyNZ5HDQsLXK4wYBe5Ok/EReMByAKf0TjFUnjwv47JcgyoKPDj9876
         rfvscPQaUt4W8YRf0nYnQGxsdhAvAm3drkdjRG1wpx9A16nEx/AYS6MNNx0hJa4WXYqJ
         DotqTvmuSfNak9G+v6CktUFtOVsZSab3Ty1XSrpp21pSj8n46qInuw2Ko426j1DgwCyJ
         WIpA==
X-Forwarded-Encrypted: i=1; AJvYcCXb+mVmH8oh49m6V88y2+uixUAdzIajgLFWsmk9xn32VA1EdD0SRMkwc4o0iDyuZu2FtSEZGLnMenT7NcM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOaH7qvuM0U4RgZrxsFskeI0k09yFpwFu8qYGLfKQU9qTzfhxB
	kJI3+VxNpgAmWtjxKcWrRz7KQ9aCxRLkRCyp2W7iQY5HSTQwmraCMl6ggz9CvSHYKoMc4yez0j6
	l+NCO1oDxWEHYCNATrU4hDOILa8dhz0vzbqOhfKo=
X-Gm-Gg: ASbGnctiZsoceLfmOCPUbB394AkbmAvZcaPy4asB2+SnMQW4ruRYt/SsAXsX90s8ce6
	0iC7FJqTk1Ce17OjmjBvfrAxMQTDJ5Y78youydPwIgfeoRqsB4LHN7QjN7ROY4wQPiw5HLlDuDz
	xmlpodHosOjb7v6iVpM6FXOBfEu7CvM6ZJ9jPukvWTZJEYftOjiRzwKabXG6MmbAYKYi6vQ/Dfd
	GbusZHOMcdhXorw3XSBDCWFESPgmPslD5NUiTwQvDzi3LASaMB6+Y0UD3FTtUsdGPr5MchDisFY
	3OlMd5QQIIWR4EW4V9CEkQvRbio/GDcKM3+Dc9ISXSG++N+/OKt9AQM+TwkkA2RBKj9UG3HvHRQ
	4Rdlh2eroP2Owzg==
X-Google-Smtp-Source: AGHT+IEAGSzfMOpxmrbolmpong1BxR+uMm9NBIL1bBLX54yYMJG3qLRQsxBO1D2dsj3UIE4/5YdndA6SaL+W6coRSBY=
X-Received: by 2002:a17:902:f683:b0:297:d825:bf22 with SMTP id
 d9443c01a7336-297e56831acmr7380815ad.5.1762566130592; Fri, 07 Nov 2025
 17:42:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b8c1c73d-bf8b-4bf2-beb1-84ffdcd60547@163.com> <CANiq72kX4Yep3pNVq8Ge=txQbPnMO=zKsci5cPgz5LDS=D6NoQ@mail.gmail.com>
 <CABCJKud0G+Xh+Wbtg4SDGvk4Yh5nmt5YgHEPj-H0y8GO5R3Amw@mail.gmail.com> <CANiq72mw66ADx7LoUuqY6h9KCU=uFzcNQXZ21kMP7jBjCyyaHQ@mail.gmail.com>
In-Reply-To: <CANiq72mw66ADx7LoUuqY6h9KCU=uFzcNQXZ21kMP7jBjCyyaHQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 8 Nov 2025 02:41:57 +0100
X-Gm-Features: AWmQ_blv45UTCFAAWu12yAL46MeLrGuBV1cf6wcE3BtvuHynhWIUHkMp_cqIowM
Message-ID: <CANiq72=OFO8fBpJ6xvGunYrx5hXfcjQJ=YDqFxtMPWDzfzwpKw@mail.gmail.com>
Subject: Re: Only rust/bindings.o build fail on rust-1.91.0
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Haiyue Wang <haiyuewa@163.com>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, linux-modules@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 6, 2025 at 6:54=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Bisecting nightlies, it seemed to happen between:
>
>     rustc 1.91.0-nightly (12eb345e5 2025-09-07)
>     rustc 1.91.0-nightly (9c27f27ea 2025-09-08)

Ok, for reference, it was upstream's ab91a63d403b ("Ignore intrinsic
calls in cross-crate-inlining cost model"): the object file stops
containing DWARF debug information because the `Default`
implementations contained `write_bytes()` calls which are now ignored
in that cost model and so everything is essentially as if `#[inline]`.

If one generates the bindings without the `Debug` impls, indeed the
file stops containing DWARF even in Rust 1.90.0.

For the moment, we can just skip `gendwarfksyms` starting with Rust
1.91.0 (sending a quick patch for that), but it may be a bit brittle
in that new versions could again re-introduce some symbols that get
exported from that one etc.

Sami, would it make sense to "auto-skip" in `gendwarfksyms` itself if
an object file does not have anything interesting and then remove that
from the `Makefile`?

Thanks!

Cheers,
Miguel

