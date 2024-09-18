Return-Path: <linux-kbuild+bounces-3619-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E60F97BF88
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Sep 2024 19:15:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E6241C2243E
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Sep 2024 17:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB1D1C9DE6;
	Wed, 18 Sep 2024 17:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZmKNUWi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C561C9EBD;
	Wed, 18 Sep 2024 17:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726679714; cv=none; b=TEobrdKa4LZKGCz1fRmzJQ/OAS1nLVXbSNtklN8dosmn4kYy9Pc6ZkkoVxF5FfnhbN6koILVg43PU/zphTwC7uVEWO46pp646hAlHNWibARojlCsL9tqz8LksLIXPB6XRo3p43fYWvYcoOhewwPs4Po8tS85TKqwjdCsora4ajU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726679714; c=relaxed/simple;
	bh=0T4dzBMSx9q2Pd8rRyNMc3An/s/+jpL4XqaACOjlOKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RMJANttH4+5LArhif4mun701E5YjJLRSJIN1zTaqvR3XJS4Z/RjzI3Dl4N8hD1IZk0ZmK1UQSBvll/WRwQC6wFrfSXLGfZcC6Y7Ku709amEvq4kfx8yyHvaRyHnRe+hp17pfgIkXK77j7LXae/zAGHKDWzXH48dMUjhOxx7qEw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JZmKNUWi; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-717839f9eb6so1220056b3a.3;
        Wed, 18 Sep 2024 10:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726679712; x=1727284512; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7mOTp2QbM6JpO/W/v9h01oSVJjDYr1umsEL0GXcYKM=;
        b=JZmKNUWizL+DQ79r0bjFTSNSoLgaxXtTjAdwP3jIZ7H5wINmo8xXpJsboyuzTmkNU2
         NFW8VPmA+lkO4lzOL1+5EEWEfY36IlmNi6lH8JM/ZWkqgl8IdnSSJnvK0ybQsAkFD3s+
         v4QfBTHrPG4azxQesKdI4gpX30ase45atShM7/yg84Kcm/EKfLGHGSHeB5UFoomYAKXm
         2PZkPJAwkRVfHq3TYqq6SCznb/YWKWfa3J57Wu/mHaSQupafGKgK/hnphRA2jWPRlcb1
         D6Dfs9PNBSOPecnIgiy2HtcOHXpFk2wQCDQsIMVCBKZR5Zk3FcxqUi3lpGxTk/9x9EZl
         DbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726679712; x=1727284512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7mOTp2QbM6JpO/W/v9h01oSVJjDYr1umsEL0GXcYKM=;
        b=oos8qCFaaMC2QRgf8LxUeAR5YhHnL4D1XGug4U7Bycmj1OchETz+1Bk94pYO+rLw7r
         eXZm+rcUTSLvhbtaAYUee7JllKfW9kOa6lBv0xrlqBLqh07KJtL4K7VwXeixnLuiqXas
         OXnBRQrMre2OehsMq0q8gLQkAlmOcGDNSjjQa6AoAjGe3J+RTNdFy5ThjVC4gIVD4n0Q
         9Ywv/HUo5tY/fva9F8c6BxQMgmRiLP/JdiIruaDNczDLu3nieB2/ubZyI3bDh5PKLcxU
         oCW3aBmngejOU2jBfOAotEmtlPk/KCAx0s6rn5BH7i0FGqU/QZ/RB9t194xvuDovjxlr
         wjxA==
X-Forwarded-Encrypted: i=1; AJvYcCUEKovbqAksj/Rc/hql4Ny9WadJsQAf79FMvbIr2dXHpVA8Y3wCsb+WPooi0D6vF7SwtF/iyPlWx3ixwN+y@vger.kernel.org, AJvYcCVnu36CmLgzdl0+qZIDhAsxIGQTYfKHr8FMJT72c5fNA8L14mFXhnUEoDbp47s4nGKflDZPYTgnRHOxsJM=@vger.kernel.org, AJvYcCXJ/iI40qd+ceO+ctMMm1iUi52jGZgtQxqS6bkySlIgzv5pgJB6ErPcaHHHBQH+cUiVEQAmP3xlOi4b4dl/s0w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVOXsKf1OjXGApBE0G3ahyXMRHZ+5kJ85G8ntO6uSeuyClw1Xt
	NRkBpZ8sfsWmYjopAs2JwKjB66gb4XHZtOfxJeG2NM3bE7u6OCefDGX0Bodb1vrgFvslmkgS1fx
	vg2kozZKbw1VShha/ZnRPzNVONzI=
X-Google-Smtp-Source: AGHT+IFF/LgKgX/HNMX/z0sTSTA3m/uP1n0NQbvd23SX9AXcy4JiGh1ahWMx5sX7FZO7LoZTcKcEbe5HMqBMTNNhF7U=
X-Received: by 2002:a05:6a20:6a20:b0:1cf:3be6:9f65 with SMTP id
 adf61e73a8af0-1cf756c40eamr15771809637.0.1726679711964; Wed, 18 Sep 2024
 10:15:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240801-kcfi-v2-2-c93caed3d121@google.com> <20240801-kcfi-v2b-2-c93caed3d121@google.com>
 <CANiq72=B9NmC=1eSaOrg7XutjueQsSXGcBQb7dQFPuL0SFjPsA@mail.gmail.com> <CANiq72miDK-Z3v46QX9MQTT_raJTz+ja-Qx5j1qBmptHXkhY+A@mail.gmail.com>
In-Reply-To: <CANiq72miDK-Z3v46QX9MQTT_raJTz+ja-Qx5j1qBmptHXkhY+A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Sep 2024 19:14:59 +0200
Message-ID: <CANiq72mF0_RUU4=-OGCHv-O4MBt5vkNYvNByEAVQ3teA2cEapQ@mail.gmail.com>
Subject: Re: [PATCH v2b] rust: cfi: add support for CFI_CLANG with Rust
To: Alice Ryhl <aliceryhl@google.com>
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, benno.lossin@proton.me, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	kees@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	masahiroy@kernel.org, mmaurer@google.com, nathan@kernel.org, 
	nicolas@fjasle.eu, ojeda@kernel.org, peterz@infradead.org, 
	rust-for-linux@vger.kernel.org, samitolvanen@google.com, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2024 at 6:14=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
>     [ Replaced `!FINEIBT` requirement with `!CALL_PADDING` to prevent
>       a build error on older Rust compilers. Fixed typo. - Miguel ]

I also noticed we need Rust 1.81.0 for the flag rather than 1.80.0 --
I will send a patch later and/or rebase.

Cheers,
Miguel

