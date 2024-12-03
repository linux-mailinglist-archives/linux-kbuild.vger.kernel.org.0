Return-Path: <linux-kbuild+bounces-4976-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 491E89E282E
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 17:52:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F6CBB2B818
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 16:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 738E41F893D;
	Tue,  3 Dec 2024 16:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="H6o9CfyY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9D91F891F
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Dec 2024 16:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733243047; cv=none; b=U/odbisX04ihKBus0Gc/oMSovN8WuPXm+zO810pMIR2QR6bSMOGRKpT4wTxoCj9FDRBKAZ/8S1MeCE8x8o5OzycyyG3I1IjLW3oE/w64MLZ561cRS69gC3KbQ4u+4vuZM5o2ruocKwT/hVGdESScrfRk9GUBV+cTUhr2OJOjKdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733243047; c=relaxed/simple;
	bh=f+P/kAbB1gWGPCsxHq/pGGSoaVxgmWew0X65TGH31wQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tN+j+44JMt9GZkftt2CYNCvAFr/avMkf70JH4zqXXuFofgLsvKaRIxAcLqieln6Cy5JHek83dTMEyvQpWwbbZmz5IF0Nrx1v9ygLqg+LECJcd+pEA9NRIe0rhZeI7t4DfUVy4rl388AIzXaVLzZJZ089qVQR0spE5EoMVyxR3r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=H6o9CfyY; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d0ca0f67b6so4757761a12.3
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Dec 2024 08:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1733243043; x=1733847843; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wtSjOuVKtZRnK0WO9fp7EqIM7Es6Bf3JeXvEkCB5I4E=;
        b=H6o9CfyYlem5jZWF0Aehbsa5B+h7qb5OKHMheRkWET8NxZIcIZaUeJEyot9lcT60U8
         a7oR+4x36myMjUyhFWcuLviAZg3D7UMGUK24VkwnmxuVUjnOO039g9ElSxLgPpC6tGUV
         2M5hfyaAPIv9I+kaHfmjhzTbm5BD1qfaJctvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733243043; x=1733847843;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wtSjOuVKtZRnK0WO9fp7EqIM7Es6Bf3JeXvEkCB5I4E=;
        b=kameRF1681gBJTYpaSoXZ8dmjvg0Lb5e+rYaqrO7sN2/e3BdqWvMwDHV4vcydp8uBD
         O3Ma+qi5T7ZSwNn26DBgNabg96TwoMyiYs1FNKruZ/4fNQYVi1OlGxmPOnvUcHGSnUq6
         IkiRNnevlVioWOVC8NxiL4AZt/+yWk2lBLjOz/yUjjOWMJSlb1pvExTJTx1R3H89Kikh
         q89VEsUpIl0hX2T8fBLfPn3f7uExn1dJpum2XYxf7zyUifngGlmrRCVKmvA0TGE8mDCp
         5bCVoHFdJ3OehuXT+IuWuVrHCjIIBWXD8XSW7A4uShOcM1eu3EI3MK0zcWKsQyimGphT
         8Wpw==
X-Forwarded-Encrypted: i=1; AJvYcCVUdsUw3GWIZnbOfwW7xwrF/WQp7fbYAEJBf7YXjT6ZhLACWxampM3dsq6UfWhf50wumJ8a4uE7NPXOcHA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAXZyscx/IX1wXcsigYO6zyXpJVhyu7hVAP5GYViEnp9K4SaH3
	I8Q/j7ovZjc+YSYQXaNnRrqFGuSpKYALJyI4FVIz0+Kh3aUQ9y9HvBHloBpI75GScniATHGNHYR
	IyRnpjg==
X-Gm-Gg: ASbGnctKblAcwouaJmtnfUtR98YM2MkU4eNWtMoNOO25yvkyHclWnAsYbuoai4Ti7W8
	1foUGvbPI0ZVvUXCSmaZGF9ZVELLl4tuO8gdqDI7UCb0I9j5oV0jtBwhGVSOqSfyleVhrSnFkbB
	S01VQ7erApmuIMJNhg5iNTWIra7rB/ZufjfhjeiuL9JzPufFv1tGVTscaIFnFnTp0X7ituTmEJJ
	moVuDIImgPqhRVJ6A1aKcQco2fM3MC/82RKvNHIr47wGI10XNdo3UbgsPnakOabFPonxKeC/w6S
	S+C1JYBMg1h9OYok67tiKBVo
X-Google-Smtp-Source: AGHT+IGdGIbBgk1i/j+dINhwCGOsEgYcwhZWQ2GoifLKivC6/oB1yMmi7YVgrtVFBSL5oqJpovKxOg==
X-Received: by 2002:a05:6402:4301:b0:5d0:bd2a:fc1d with SMTP id 4fb4d7f45d1cf-5d10cb826bemr2461337a12.23.1733243043667;
        Tue, 03 Dec 2024 08:24:03 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d0e5367115sm2894599a12.58.2024.12.03.08.24.02
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 08:24:03 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9a68480164so775503466b.3
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Dec 2024 08:24:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXhIrJZEmN07Taz1VZktu3voaE3OJPkEqtDnJYlPpemYh+OG70LTPh0+ftrkNHswTXGlnOw/NSiOCTJq60=@vger.kernel.org
X-Received: by 2002:a17:906:2922:b0:aa5:2575:e76a with SMTP id
 a640c23a62f3a-aa5f7d154e9mr213082766b.13.1733243042083; Tue, 03 Dec 2024
 08:24:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203102124.3147478-1-masahiroy@kernel.org> <CAK7LNAQ8MKTWWzLNYDBMCcRzWGVhX-kUyFM=BwK8-maKtqZj3Q@mail.gmail.com>
In-Reply-To: <CAK7LNAQ8MKTWWzLNYDBMCcRzWGVhX-kUyFM=BwK8-maKtqZj3Q@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 3 Dec 2024 08:23:45 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgCZX5YzWhKMvyF9Do_9hvOfFV8mMa_GGfh0RRLv0MJ+A@mail.gmail.com>
Message-ID: <CAHk-=wgCZX5YzWhKMvyF9Do_9hvOfFV8mMa_GGfh0RRLv0MJ+A@mail.gmail.com>
Subject: Re: [PATCH 0/3] module: fixups after module namespace conversion
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Matthias Maennich <maennich@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Dec 2024 at 03:09, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> I submitted this patch set to you, hoping you can merge it.
> Please let me know if you would prefer a different course.

Applied. Thanks,

              Linus

