Return-Path: <linux-kbuild+bounces-8162-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E26B11B41
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 11:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3837F17880D
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 09:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4FEC23908B;
	Fri, 25 Jul 2025 09:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAZk/4vv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC6B2D375A;
	Fri, 25 Jul 2025 09:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753437226; cv=none; b=bAuFSWMFwY1v5MV0tMgPWyXU4aF9PFicpLjVZFcQNNA6tsoYopvLEqqxfUlZUYzNlfDdlfa2R/D6SUionIs7sNKCitmYDXohCjirX8wHv2y+sVCArxhmfXsBU0QlFTI5M8UdLedyYkqO4YtiGBZLs7s70vgGcYz+jWUlnL5ENk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753437226; c=relaxed/simple;
	bh=61I/HMiVHjNrz0vIaotjhtm+q8kFS8pE00BWLOKLfbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o3jz+BuI1lH4On/twCmfCWbYkH3KDUPGAlzpDyqM1Sn+BtHxNI3N0ndde9Veh8lytT4IZ3H36Crx7Zwp/kn1h7Nu444bGg10GWDppmFYn8pxsOXfsIu7aptCrtd/PgG/lrlmC3gbKpM3RLAgiFHLCzH70lPh4mvR+KzoEvpUgJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FAZk/4vv; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4550709f2c1so15864565e9.3;
        Fri, 25 Jul 2025 02:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753437223; x=1754042023; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S6lNHUAeD8j26I1ynzyj/RanoNhriT1omATCreLCNzg=;
        b=FAZk/4vvU1JE2k1shJGR+M6gZr0sgxBGEI30T5dFYslnnj2XFkQCSEyQkYjocle4/6
         nijGAN4wRCPEASHg85A5RZY6sPLx1z1yqmqeg576r7EfxzFf1ekXDaxAoZ0s9T51UvFT
         mLCxdRz50ymSsE2ybyawWm+bi2T6ANtECCPh40ZX+zaO3QCetY6Fj71wiYAQtZfAAYpM
         5zsfhV07zTx6RavCd0eFimfgokd/pUkA9S2+O8+fLlkrlIieNiD+iecRcQEBjjWRxcAh
         viMoZU+CagZzfnz+F2F6r/2q9CNLroKfb2gFnLiNwVzqkK04lI3mU4YOv2r4WahLeRot
         6cUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753437223; x=1754042023;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S6lNHUAeD8j26I1ynzyj/RanoNhriT1omATCreLCNzg=;
        b=ZbtO/97R/eWDPa5xNeAbtzgaN3daf0L0H2h6cQZfrJtMXEr0IbxTm9WY9wMR2bj3l4
         0XzLJT2JAVU5ErCVw9jR1Xb3X3xWZXcAafpmQOqZnm4SYLcsojwnMHD7Ugin8tPzus0h
         j9UaLFAFVT4EWrZFthEaOR0q3c8MPvb9EgBvwLfi/UE7cRW+8FF8DFZJ3tX9PL6OsCVU
         t6rpTLYqbUKHC7vanSpl33ktnIgF3lfucrHxzKE31uovf68/gGAU3kRwOeLoiv5yFrVc
         itUVF8irZOjeXj9DSg8//YVLPXS3VHbr3jGUWQSpEOgdgr4tbpkufzTxywY/Jz0TiNw0
         x6TQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbmdRZVf+lwAS5TBwTQUUYynn1eVNN2vpHZ+8SYEF2SBjya1HjM4ND0BH3UyaF/q3snFNw+wTu94wVQ0c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1V/770ynk0ot3BhZRs4XjZ5b576Q61web776sTNapXg9lM1LA
	OulM5mjzPVOZ8Xao/50KAsJDBVlnv+PmZjpB5/AEE2yg98zp//USM5se
X-Gm-Gg: ASbGncvnug1FqgJTvPO1WxsWhBlNh0wk++QiARQTAj6SJAHIHR4iHZn94Pv6cEgeMwe
	0F3XqsWBwZBKECW8mqYECYG/3bwjGj4Qv7IcnJr0CJ71TwVmGoSUbeif1eZ2QfaQDmxb+JZ/blp
	OlLM5iqDZpNM1gw6y2HfYpfgb3tyB6/BwLniOIaJ9J//aOnDr4U9pBJFJOhj8yTDF5LeMHCZH67
	mVXJ5KI0tC/1aJUllzTj4HXspqeN1tmmc9ek5fwZ8cis4dL93m/g24AJm8V+TLpKkANt0SSZL0D
	/DYjS6q8/USiAQpqONb/MIWDd6nAtyZQ5aTLd8eHFkvD4eTVuXVPrk/lFowJZo14rLBwWT2w9hv
	5GDjjcJJ6wsVRy0gC/fEyjVVcD1TdV+LVvBB6azRrI5JhVPCHlBIIlzHk
X-Google-Smtp-Source: AGHT+IEXje2nWfsh3rKmtUR15CLNB9cPpTTFM66LlUNcbTqJCczZDV6Oxe5Ag0Lqd0Ujztp2Y13gzw==
X-Received: by 2002:a05:600c:1c9e:b0:456:18cf:66b5 with SMTP id 5b1f17b1804b1-45878201d55mr4405955e9.22.1753437222791;
        Fri, 25 Jul 2025 02:53:42 -0700 (PDT)
Received: from [192.168.0.3] (mob-5-90-141-12.net.vodafone.it. [5.90.141.12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45870564de8sm48477455e9.23.2025.07.25.02.53.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 02:53:42 -0700 (PDT)
Message-ID: <f020e62b-5186-4461-8fe9-de64d35de488@gmail.com>
Date: Fri, 25 Jul 2025 11:53:40 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kconfig/lxdialog: replace strcpy() with strscpy() in
 inputbox.c
To: Suchit Karunakaran <suchitkarunakaran@gmail.com>, masahiroy@kernel.org,
 linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 Franco Martelli <martellif67@gmail.com>
References: <20250725055928.37658-1-suchitkarunakaran@gmail.com>
Content-Language: en-US
From: Franco Martelli <martellif67@gmail.com>
Autocrypt: addr=martellif67@gmail.com; keydata=
 xjMEXwx9ehYJKwYBBAHaRw8BAQdA8CkGKYFI/MK9U3RPhzE5H/ul7B6bHu/4BIhTf6LLO47N
 J0ZyYW5jbyBNYXJ0ZWxsaSA8bWFydGVsbGlmNjdAZ21haWwuY29tPsKWBBMWCAA+FiEET9sW
 9yyU4uM6QbloXEn0O0LcklAFAmhyroACGwMFCQ0ncuYFCwkIBwIGFQoJCAsCBBYCAwECHgEC
 F4AACgkQXEn0O0LcklAHVwD9H5JZ52g292FD8w0x6meDD8y/6KkNpzuaLHP6/Oo8kAIBAJsh
 aMB9LdCBJTMtnxU8JTHtAoGOZ/59UJWeZIkuWJUNzjgEXwx9ehIKKwYBBAGXVQEFAQEHQNP5
 V2q0H0oiJu89h1SSPgQDtkixXvUvRf1rNLLIcNpPAwEIB8J+BBgWCAAmFiEET9sW9yyU4uM6
 QbloXEn0O0LcklAFAmhyroACGwwFCQ0ncuYACgkQXEn0O0LcklASVwEAoEkHMEU7mHc0zmAu
 D2R1PYsDh9+3wQeied5PrF+HdakBAOeSGsf40GBew5umZuM59I04d1uXYAXGMP+jGN2RUtMA
In-Reply-To: <20250725055928.37658-1-suchitkarunakaran@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/07/25 at 07:59, Suchit Karunakaran wrote:
> strcpy() performs no bounds checking and can lead to buffer overflows if
> the input string exceeds the destination buffer size. Replace it with
> strscpy(), which ensures the input is always NULL-terminated and
> prevents overflows.
> 
> Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> ---
>   scripts/kconfig/lxdialog/inputbox.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/kconfig/lxdialog/inputbox.c b/scripts/kconfig/lxdialog/inputbox.c
> index 3c6e24b20f5b..8880ccaffa0b 100644
> --- a/scripts/kconfig/lxdialog/inputbox.c
> +++ b/scripts/kconfig/lxdialog/inputbox.c
> @@ -40,7 +40,7 @@ int dialog_inputbox(const char *title, const char *prompt, int height, int width
>   	if (!init)
>   		instr[0] = '\0';
>   	else
> -		strcpy(instr, init);
> +		strscpy(instr, init, MAX_LEN + 1);
>   
>   do_resize:
>   	if (getmaxy(stdscr) <= (height - INPUTBOX_HEIGHT_MIN))

perhaps it's better to sanitize the whole code in
script/kconfig not only in lxdialog/inputbox.c

$ grep -Rn strcpy scripts/kconfig/*
scripts/kconfig/confdata.c:143: strcpy(depfile_path + 
depfile_prefix_len, name);
scripts/kconfig/lxdialog/util.c:348:    strcpy(tempstr, prompt);
scripts/kconfig/lxdialog/inputbox.c:43:         strcpy(instr, init);
scripts/kconfig/symbol.c:764:   strcpy(val, newval);
scripts/kconfig/util.c:55:      strcpy(gs.s, "\0");

because the script "checkpatch.pl" emits a warning
whether strcpy() function is used:

WARNING: Prefer strscpy over strcpy - see: 
https://github.com/KSPP/linux/issues/88

Kind regards,
-- 
Franco Martelli

