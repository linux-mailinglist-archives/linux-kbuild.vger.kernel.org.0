Return-Path: <linux-kbuild+bounces-8304-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 735F8B1BF98
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Aug 2025 06:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD32F189BFE4
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Aug 2025 04:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2AC19E96D;
	Wed,  6 Aug 2025 04:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZKTvGpwl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E541E505
	for <linux-kbuild@vger.kernel.org>; Wed,  6 Aug 2025 04:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754454926; cv=none; b=q3GGpHE8ytvmhtifyEVVkJ91xJsrz/1v5xc38vZ6TDjDfz4WcxJqeuqucGsUkMjzB1D5rFvbkZug/EBAtJbYTOkD+ybLuieBe4Oj3PgC6JF3T8ftL5jOjX0czzlnlStvudynHurbgeIgEhIqMiGxDTDTY2ok8zWaAfn3+8FG4qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754454926; c=relaxed/simple;
	bh=ixqP5isrz46vellfu1bMac3bIcLlc426urXjlfHqYPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dXKzVjsdxdxoWODLHKuMcZGNtD0DGz40R+tN70sbSEZcQR2oeD19HjiYdHa7rOICUqmWAfu5aGtTyYfayq1iJ0IGOHpJRr/1b2L9M9PEXwfuZFnc1JiwqA/NAn6cfmBiDa0Zj6f1zBUmNXB7G96DR75WcUsnZgNpxRyPT5lbmuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZKTvGpwl; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae9c2754a00so1501263766b.2
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Aug 2025 21:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1754454922; x=1755059722; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oMFp9nPrvETLnaWO/a/yk4nWBSLPEvGgBPivTJ6uYRs=;
        b=ZKTvGpwl9889Vb3PsKwwhHyLlvmUFSRuSWLTuB9Bd8wTRDYfMTzTc41GTRTbdZn27f
         wxtiDBlvPQTovXk1+ASWQbJ0YNpdDlv1RM6vE1GriP80nHXgBc3BwOtSD3z+DXKI7cN2
         kn+1VXjQl44cjNh6+2FGtvRRUDhbYpyPoLSCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754454922; x=1755059722;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oMFp9nPrvETLnaWO/a/yk4nWBSLPEvGgBPivTJ6uYRs=;
        b=xUthdXbuoZFV/X6NnFxhHGAuZ9tBtwnLp+DEX0f6919IdzXUCr/fuiHs9M3qYE8uYE
         /rEat8do5Bf/2ezp9EfRvAXnxdOPTLjNwPpNSFR0rk2jXjAp/C1U3bD9RZ0o+CcAAB+E
         8Y0KWh3bTmk1fUDoJq0Vx2MioRNq/fI7o3fE+KvVJE449CugSHMmLykdGZImyMMNcdNd
         L5BxAHYWBxENsNqWaCYa9kI/Krj3/ptuB6PMLLbOyaFLahoO2fRVsfTisEkE/wKYVV46
         t3GNudSEqjgeipHZotfTqy+IPkVwQncAZZE0Dn4/ZlogX+7ZCLoQ7RazDuBlO0XATnIR
         Pvhg==
X-Gm-Message-State: AOJu0Yyc3A3k4aovxB9Ipuivpii/6MgeipeYLFkMTd1zM9rILzIkxLKH
	frwQvE9RMa2E1uy9X8ZoHOdL4Q3nuelJ6NBSsF7A25Tho5PmBsYQMWhEue55E/e3MI7SDo3NJCk
	gWmMLSiqV0w==
X-Gm-Gg: ASbGncsX+Fux9w/ybez/lcBEdPmeWyNR2DGtWL/GPkE+xGdXeBJ2r/uqIuQIosIRZs2
	EpGfMCDJRoORksvswToSKE/tLD8oYIRcws4hfmIRU05Ps/jlBDiFZsA3XK9bjX5Shz5aKkNzzNT
	BKtI1HqegJDfqdYlCSDusAChDX8hzZLNopIgi5JrXAv7Jvh7OzGlh1c7T5fLvBpkhwI4J1ZJh0b
	8lLyDdNDDYMDILK91Uvm4kuY/pt+spmJaxbcT6db/4YEEgHeNqwp+xGynDz4TYSoI4QGvQfKtlW
	eoA4Qag7wFzIToWW+4W1F7Khm4kOTchCN+vMdIQXwy9RcbktfY/yCStGb815bUr/Nl5DO6kqvyz
	6f5p5umaHGHrOEx0xo9T00Tkmdzp3IZRTjwC6vZvt1cachRsuupKwhTqi4Oqih6VG83QUf1a+
X-Google-Smtp-Source: AGHT+IHa0hR5DDZ4x0S5fLLsreXlcCgKl/E4Geo5thn9zDairoHkWntT2Rfu3dDcmFmkZdhtO1zYOQ==
X-Received: by 2002:a17:907:94d6:b0:af2:5229:bd74 with SMTP id a640c23a62f3a-af990344c44mr92154366b.26.1754454922038;
        Tue, 05 Aug 2025 21:35:22 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c081sm1014332966b.97.2025.08.05.21.35.20
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 21:35:21 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-615398dc162so11041635a12.3
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Aug 2025 21:35:20 -0700 (PDT)
X-Received: by 2002:a05:6402:278a:b0:5f6:fab2:9128 with SMTP id
 4fb4d7f45d1cf-617961597femr1157467a12.19.1754454920609; Tue, 05 Aug 2025
 21:35:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNAQdcpEARErjAdJLGf3whwWy-1z8kGtmEDKq3M6qqJQx6w@mail.gmail.com>
In-Reply-To: <CAK7LNAQdcpEARErjAdJLGf3whwWy-1z8kGtmEDKq3M6qqJQx6w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 6 Aug 2025 07:35:04 +0300
X-Gmail-Original-Message-ID: <CAHk-=wj1QTaR=U3_9Ypmqqu70zEiXJfE5tM--GeuqRvrYYCekQ@mail.gmail.com>
X-Gm-Features: Ac12FXwAOo4J2HJ06qEZuSrOy62yxW5XLcYCmM6rix-YQrS9oUFc8DROthH9OV8
Message-ID: <CAHk-=wj1QTaR=U3_9Ypmqqu70zEiXJfE5tM--GeuqRvrYYCekQ@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for v6.17-rc1 (take 2)
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Aug 2025 at 06:51, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Please pull Kbuild updates for v6.17-rc1.
> In this take 2, I dropped one patch series
> that has caused a regression in linux-next.

Thanks, pulled.

> And, this is the last pull request from me.
> I'm grateful to have been able to continue as a maintainer for eight years.
> From the next cycle, Nathan and Nicolas will maintain Kbuild.

.. and thanks for the eight years,

               Linus

