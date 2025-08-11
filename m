Return-Path: <linux-kbuild+bounces-8338-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C83DB20952
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Aug 2025 14:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D62017B4F48
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Aug 2025 12:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289112D3A66;
	Mon, 11 Aug 2025 12:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TYu+wGkX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18B322422E;
	Mon, 11 Aug 2025 12:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754916684; cv=none; b=WlAHy2zn5lZ1XWvD4z/F7ibtcgU/EIGU52wjbQ5W1+Gu5gCpY/CKkhTt02K1H14mqaimdZbB+hh7V4CI+3flGjAuO9nO00cGS2WDBpj+WKrkx6DtKC+IHoX/idDAbk5NBKw2PrgEn+Oh/5BSgQtRLspu0BaN/BfqsQs5TK4KW+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754916684; c=relaxed/simple;
	bh=YUmrI0iZCVOfyM6zPNdQAFBJF1hZOUFH4IVgu2H/cHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VRKNVhQvhD+WQJpvurKjSlw/0fl38/WhqKc3Y/uUo2fCIPWV5bv2SxGY525HUJooK3aiCuewWGLruAz8h6ksEbFGvPAjz/lbqV2a/JX2S6qfJADD76vEmMnx67/DUMc35GfSEycf428baXUJxT6un/v69qZMMBIvYt2Bw8anSlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TYu+wGkX; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-61576e33ce9so7376646a12.1;
        Mon, 11 Aug 2025 05:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754916679; x=1755521479; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/veBRgqqaeHpjAoCv1pi7UCX9rYQ9YRND/HhvUqijW0=;
        b=TYu+wGkXO2RHfZRZgk9YHbX4pcavD1YJF7iu6Lg+bBq2AH/LRlIuMYpfiz3RDAa2n9
         NtU6MAwJ9k+MzhMTyT2KA8b4UXMHiHqoko77DXf304V7YTPtNwU+vYGhP/hwHMwPWE6H
         44Y+Kt6IZYOvBOOM0T/vLtgbvevZzYA7Eyjky+hHGiQ0gBfLrC7YlVCf5YpF4AfXXyO/
         Td2MPYrO4KcmhKtq/RqKDQ+GfMv6aLkeHFrp83+oZXZMYadZ9NhYXdZXsTXSbVl2jwoc
         J0GlQkBLujiFo4ZOPQZFKy5a+48rbfI83XVhlSo0eiM0e1MQGO6sKIYV8aaE2bgSbfIa
         5W3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754916679; x=1755521479;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/veBRgqqaeHpjAoCv1pi7UCX9rYQ9YRND/HhvUqijW0=;
        b=XKl/mcQGaCadQvoERPpcPh1luwLnKVGFbwZfikZUN1BuqP7rTi+uHfiFAvArqSgY+E
         ylguBfyH/Itd6kd2SnNVi3vBLezUuv+WgePNEjgXHS/UDb1fuq9SeuWX+8HybTl7W9Iq
         WT79Y2KDIV1Nf/dclZjgEO9Rwxk6kb6gywaix3JgBq9yZN7nXszKkT0vQ24rOrI3vp0E
         qItQp+NbhppigNV7mqiIkwiyxSLR+6OsgdQ0wnqMlkJZSzjgMRrIsyBwAa4ErzbaszC3
         lIfFiEq7qbbSn0h2kZzVVEq2sGLJNb26CgHe5U2XfStGAqftcLYq0kmAVt43R0tHMeBp
         hGbw==
X-Forwarded-Encrypted: i=1; AJvYcCVO1FZLu07kCHPvr6rPaNM1moqOQYQlT9ZyhJCDfiFaqO1P/Xy3JSHwEKpQ0Qji2RY8LyHLAGp8DG2eQXw=@vger.kernel.org, AJvYcCWFxHDKlLD5ngfIkhJGNgozrp3t05yodG1Epyr1uM1wzRhFm3AEppXy1qHEPP2oRFa6R+bO/0RY1rFnm3Sa@vger.kernel.org
X-Gm-Message-State: AOJu0YzfK/jcbxQysJYJBrTMPSEN2tOr7xFtC3RzvcPS7o0xxHoirFa6
	4nP41Z/ltrw8j7vFYkr4nl7TTmJCNnHbpm0T7OoeJD0n7xnNWKylfRoJQO59Q8zbCwSL8Q==
X-Gm-Gg: ASbGncsMKs2oMe7QLpcDLU9bctoWLvIV9rBf2WQAJ1TnpPOf1/l8Vmd+vOjgrbiQnPI
	H1WA3JixIyA3IYQCIjsPHqRXySzs+wNSYPD7TzUYwBq6ZAglnp4yvdSCwcc1JusQZ/wizM0NSfL
	l4Wliu+ZBDL30jJ6+H31pGk2Wu6Vpk4kuq2mxikKBCNAil2ls8B/81JJ19z43BEEcomKPfIjoRe
	jJZTjIbmVe3NvNvgwBlmOTMXJZQPyPSxjjS0rL3WZfbArycoKACpwJvz0JhuH9LJlGxaqtlQr6m
	YFmY5ZNLGu+yGlv3p6GBxFoSbgeBi6/qCkXoJXg0kwBveMA7AfqS9E4dg5QzM+l9UaU2dtraciQ
	Ne0Jzq8yhnfrA3Z7nqL1yw+jukUVdVoe1VUbJCU3F1a0tvtVw2Rf+09Jr9c4=
X-Google-Smtp-Source: AGHT+IH/JyTYWdaaSQJMOy90f6UwtKrO8ROcsV5K4yUMMvI1rBtn/2MwA4RP+qDbMkiz9DD1L37S6w==
X-Received: by 2002:a05:6402:51ca:b0:615:a5f0:2704 with SMTP id 4fb4d7f45d1cf-617e30596ebmr10196935a12.17.1754916678803;
        Mon, 11 Aug 2025 05:51:18 -0700 (PDT)
Received: from [192.168.0.3] (mob-5-90-141-117.net.vodafone.it. [5.90.141.117])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8ffb8d7sm18544292a12.47.2025.08.11.05.51.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 05:51:18 -0700 (PDT)
Message-ID: <98b4d33c-24eb-4034-82ce-e88e85f8e6f2@gmail.com>
Date: Mon, 11 Aug 2025 14:51:16 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kconfig: nconf: NUL-terminate 'line' correctly in
 fill_window()
To: Thorsten Blum <thorsten.blum@linux.dev>,
 Masahiro Yamada <masahiroy@kernel.org>, Randy Dunlap
 <rdunlap@infradead.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Shankari Anand <shankari.ak0208@gmail.com>,
 "nir.tzachar@gmail.com" <nir.tzachar@gmail.com>,
 Michal Marek <mmarek@suse.cz>
Cc: stable@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250810142239.120294-2-thorsten.blum@linux.dev>
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
In-Reply-To: <20250810142239.120294-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/08/25 at 16:22, Thorsten Blum wrote:
> Use 'min(len, x)' as the index instead of just 'len' to NUL-terminate
> the copied 'line' string at the correct position.
> 
> Add a newline after the local variable declarations to silence a
> checkpatch warning.
> 
> Cc: stable@vger.kernel.org
> Fixes: 692d97c380c6 ("kconfig: new configuration interface (nconfig)")
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>   scripts/kconfig/nconf.gui.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
> index 7206437e784a..ec021ebd2c52 100644
> --- a/scripts/kconfig/nconf.gui.c
> +++ b/scripts/kconfig/nconf.gui.c
> @@ -175,8 +175,9 @@ void fill_window(WINDOW *win, const char *text)
>   	for (i = 0; i < total_lines; i++) {
>   		char tmp[x+10];
>   		const char *line = get_line(text, i);
> -		int len = get_line_length(line);
> -		strncpy(tmp, line, min(len, x));
> +		int len = min(get_line_length(line), x);
> +
> +		strncpy(tmp, line, len);
>   		tmp[len] = '\0';
>   		mvwprintw(win, i, 0, "%s", tmp);
>   	}

Is there a rationale behind the choice to avoid to use snprintf()
in these circumstance?
Preferring snprintf() you will not have to take care to
compute the position of the NULL terminating character of the
string, it's done automatically by this function.

Best regards,
-- 
Franco Martelli

