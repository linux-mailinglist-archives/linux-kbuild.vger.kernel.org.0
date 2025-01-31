Return-Path: <linux-kbuild+bounces-5589-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FBBA243B7
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 21:16:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B781188A8ED
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 20:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 042F214EC60;
	Fri, 31 Jan 2025 20:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZUyaBb5o"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E183B482EB
	for <linux-kbuild@vger.kernel.org>; Fri, 31 Jan 2025 20:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738354561; cv=none; b=jGyY+Goy3FBJpuD3wxx1iJCr4oSyaOSoAxwdH+s1G7u06lWO5rwZfRXEhp3TGQIiMr0DfdHseCbAvUGGIvg0ZHGovckp5AAIyAiPj4ieddvVSH1eIsm37grRS/nYtnHKzWtQ3HAi+XYrHCM3/2OeIhi8Tt2SRXPLN9KUaEJWvvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738354561; c=relaxed/simple;
	bh=uyfEtlalm7/2N01yVWSHdBZ3Ltv3eZdpHMgUF3R+Au8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oy4AF76H3QFmzxk02z2fj3quC34CXFIKP374dr83cgX2mZSGSjvvExJHZKQ4qSWoGp7xXZyGtAjID1BoMF9kilkO8bZHhAMh7C+hyNTJ8lmYWpNbo0jxn0JRT7uyZlv2sLNxef9XUGayqwsiyXtfMKPeSo/8/AvCsb434pntisE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZUyaBb5o; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aa67ac42819so368084066b.0
        for <linux-kbuild@vger.kernel.org>; Fri, 31 Jan 2025 12:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1738354558; x=1738959358; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+PfSgXSELrUaoTDkqCzKwOcJSGmSEs6lHYZmUXLsucE=;
        b=ZUyaBb5obN+CAyN/xjV2tFQ1ZRHXsUAgOXpO+L4mg9Srd5g0Np6l2ARNvHihj1vbfp
         83uHrJd1XNQktuJIorGPYEHCUFFNvrU3v0sUbY3qUNw6UuZC4ZnyuN5CEI3dWxLcGkBg
         K4SRHfjnV6BXUJ85BZZTzefnjC0wl/Ab8HC6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738354558; x=1738959358;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+PfSgXSELrUaoTDkqCzKwOcJSGmSEs6lHYZmUXLsucE=;
        b=SUpI6N86DIx182N3+1TodT7ZBEQyQOwc4vSnv9nWMiXg+mh6rb63yBYkf6eUQtaQpR
         YdJUB0hJoTItR7bT3AokNs04j+ythm1u2gtq7smPTvDBSjHsk3VH5Z3+SCN+TmcjqAYc
         CetK7PVpYXumOoycID0fJB5RByEIuJI3pKSxqVk5VY/wluhZHXTUczzPg4E5HhBwvIvH
         E5swASakqjOs6lnK9YCNvQa5mqBP4BuSpkWqYkw3PbYVTA99WySD86zSITQOWwbJv6ve
         LVrWHce4+xsPDJQt7wo0Bq6oIoj42Y23JiRIZY67qLcuDokMBatNlpQ2Xy26iJ3vJ3o6
         TSwA==
X-Gm-Message-State: AOJu0Yw7HesV8f20C54hYfd73nBbvcGzx21gXsd00PdaP30IP2ZGiXM/
	Wkm7JwMpcq3/e5uDiSMZcL+JWhvSuT9LDUNbL5QbqYLIM/g8VI7Eustc/LDDttQ3a0fIuP52Gjh
	CyGo=
X-Gm-Gg: ASbGnctmjw9Bt88hpdzo1sUIJq+K23FfywkP9FLwRwmdX29j4/kGkyqyar7D3PXCwME
	6m7NTC9A/Rxq8x3LHnNmNTZBWtfCySvjGJ8sl9VQHo7AjmJ4QlwfVC5NnuhXmSCNUCznZganPYO
	fFFhTc3Q2wS7qsx8osIk0aOx6wE2mGqFFLk31485SA1kd1GPfkFwLjad6FmflEVnxDWeMR9QEYO
	2bfMygzctu6qNrBo7omL/0EqZ50vNxmJpgc1y6HFjBIdYqu8xaG7HB8LXJGWl2ulqkTu1iOCdqY
	cnyNKkaYgwuuByacZgnNHemxcAOFsvAXkvLRcnJ+7OxgCAzwuSs6sFfmrxtyQzAZ0w==
X-Google-Smtp-Source: AGHT+IF7B8wFJNhszK7uZ+DT8qdvFFyfCC8LNQuAo4+alTUo6wZuGz48L2UnjT/5U6ij6h2pd8kMDA==
X-Received: by 2002:a17:906:794f:b0:ab3:3eea:1ccc with SMTP id a640c23a62f3a-ab6cfd07ca4mr1412133866b.27.1738354557923;
        Fri, 31 Jan 2025 12:15:57 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a2edd4sm341366166b.124.2025.01.31.12.15.57
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 12:15:57 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d3d0205bd5so3581310a12.3
        for <linux-kbuild@vger.kernel.org>; Fri, 31 Jan 2025 12:15:57 -0800 (PST)
X-Received: by 2002:a05:6402:2747:b0:5d9:f9b8:e7e5 with SMTP id
 4fb4d7f45d1cf-5dc5efc6f82mr13561155a12.15.1738354556788; Fri, 31 Jan 2025
 12:15:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNAQeyWYm2OZ6p=vWJegs_VZMz5RN+0fze6GG=f-ZGWQ3nA@mail.gmail.com>
In-Reply-To: <CAK7LNAQeyWYm2OZ6p=vWJegs_VZMz5RN+0fze6GG=f-ZGWQ3nA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 31 Jan 2025 12:15:40 -0800
X-Gmail-Original-Message-ID: <CAHk-=whzh=4XxP5mQEh9G+xYOjBLxpyV16Hk9NWMp5PszrKRWQ@mail.gmail.com>
X-Gm-Features: AWEUYZlbFPcnU2fZBjulclvXOpxQ-WgVIzYy8hdJtliGciimcsvogBzeWwY4yos
Message-ID: <CAHk-=whzh=4XxP5mQEh9G+xYOjBLxpyV16Hk9NWMp5PszrKRWQ@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for v6.14-rc1
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 Jan 2025 at 11:45, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
> tags/kbuild-v6.14

Hmm. I was expecting the CONFIG_TRIM_UNUSED_KSYMS fix to come in from
you too. IOW, this:

  https://lore.kernel.org/all/20241214105726.92557-1-masahiroy@kernel.org/

which fixes the "load_utf8() ->symbol_request() -> symbol_get()
returns NULL" case when CONFIG_TRIM_UNUSED_KSYMS is enabled.

Obviously I can apply that patch directly, but the reason I _didn't_
do so was that I was just expecting it to come through the normal
Kbuild tree... Pls advice,

                Linus

