Return-Path: <linux-kbuild+bounces-7345-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BE5ACAFE3
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 15:58:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC85A3B1C53
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 13:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 350EA21FF39;
	Mon,  2 Jun 2025 13:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EoHco7Hz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B4E1F4165
	for <linux-kbuild@vger.kernel.org>; Mon,  2 Jun 2025 13:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748872677; cv=none; b=rrF/nVMldfwSvSu77renIDt/81wUe2rP7OhOdqZWlZ51Sm4+ZT+4xLnecXVJlcuIz0H9L/ndBqQDO5q7pRMyTg74GIQwrumVVlf1doX8IjwxAI8LZAX8E++cz0/yO8BNM7eoZdiypdSxXJTbngtRwKW+ry45D6Fr47GSu649MP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748872677; c=relaxed/simple;
	bh=GrlsIvDzXln21iGEWPRSxSXHKdrF0QNc/cVh4oj6Hiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VeeFs2B2i8UPLdhCiOu/DLf2C8cO09Z6Z6kCejrZl2Y+5ok4t5TAlFHczUFdGEdkezUkghFMukuVgJpZrABzYhZEDIaA3Yijz9zXdt1ahvO4JJMj3jikYGby/5+1WoVYZtZwfwuJ2F7DMg7/UUvcqsGXJfsqYT/0i+cQmw4KhX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EoHco7Hz; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad883afdf0cso848143166b.0
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Jun 2025 06:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748872674; x=1749477474; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eiXVz8/CddBm1jEBymmK9x488W+BJQmfHbv6Nj8A7+I=;
        b=EoHco7HzQMTz9+LqWvTz5PKXOg1cvs1/BWu2MyX9VZtF2LtKGZsoF964c172jIZKCM
         CLlmICyVsIIkXnhzxEBOFIZswiKlkJuBqnCAIp7ouJ9aTrnxW5GYODxvNsLy3Z5YT7q0
         0iJPnsbijztKp4SM5rqjrwMkv7mnjs945gQZeMNSXWdQdfpvmeuhzEPa9UNrdhdesrsq
         nRtli4cHY4jj1gz8tuCnaoxpanMqGpvsMKpIupTUGzd75XBzbmQF9PiDj+6/EwBWoWSs
         aZFT478P9ylyXPrKYmKu452wnq9pKVPfHDuYu895BNkaZ3bYZwxhWsaCYxmGDlVDHLEM
         Jxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748872674; x=1749477474;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eiXVz8/CddBm1jEBymmK9x488W+BJQmfHbv6Nj8A7+I=;
        b=iFkjuLJXL7neSx8WwbREgz9j8FPzr2gfnLMDCs+SkuzxosbdTY5WeB8WB8Q+iyYgsP
         gwTXd89JrTHyOkY8Rmc5Ki4gGOc/tqJxMaUi1MG3XH0KiFwdBx0/xe6prSNjpmHG6FSA
         1Tjd/W4GaVc2Zz3G5xmHo9y9dF5gAWqj0NimIBfs7F0GeSN4rFHFjLN04ZpQZLpP4Tv3
         BkRX9HwfOMJ+Cz3d/HxvzAwzR1CvVqYlGRh3I5jznkVcO7LfcXH9kzFCHeYYjc3Zz8NE
         EtEmXf0JhPzop16+7++xHATjZ9bODTgf0q3Iwwvh9TNGH+eSMUlwKl8Qcmi4DJ+1joHv
         7i8w==
X-Forwarded-Encrypted: i=1; AJvYcCUi1rvkZIUC62HV3wg75xh2uoRTBhRDc7/y2i4kl1YldACuSILmrHgdrCbPYztLsxEV19Nzba2ZrbKO85E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxIdxDsgDnTHxJt3UKKEu2Lf+GoPMrvAEjHvzVkh2WmAmbrsPo
	Tj9y9nYKwq4bAv5YFXJvkKsxZlKdYjQ+gJ0AsXg8UyUd78oXx0SK1ssyAVHludpe
X-Gm-Gg: ASbGncuKf9fOYMx42nNDBS2vJki1GMDQLIhjKvuIxohIGOXO+G6tfScBcKFAolZpnG1
	oDShjUvRQDviEffw6ARLASxzJ0LkKJq4iCVtflF4iG5cp1HmhWz8iFOW8mhVbI0KL29KJsiku0q
	FKbrdHaAFXuKWYkKtbCfkVgR3I4ggCKwrooWbY1v+/bRg4nhYkB3IES5MGikRHKq5wU45Su8H3z
	MdOAcWB5wmgMiSpMHtCxyQsexQHQavOW3QRjpwgeI+1kpSdxCnkFZsEW4cXqyB6Tk0GY7yA3wzO
	khQm3XRRZ22nuPuF9dMJMjw7BPti2awEa0DKbc8a3AgFguznE1gtrbLB4sPRwapdcldHn2Iv1Sg
	Waqg7Q1nHrLs48HcwsDwjfAI=
X-Google-Smtp-Source: AGHT+IEd6PthiQcqVer48FErEw7dadrWWpwjnKFnSDqTal3jTJ9kYbvZ2faBAyILvPZC/9jnLA9nJg==
X-Received: by 2002:a17:907:1c18:b0:ad5:2e5b:d16b with SMTP id a640c23a62f3a-adb36b4ce84mr1148923966b.27.1748872673419;
        Mon, 02 Jun 2025 06:57:53 -0700 (PDT)
Received: from [192.168.0.3] (mob-5-90-139-122.net.vodafone.it. [5.90.139.122])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d84e76csm794054466b.86.2025.06.02.06.57.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 06:57:51 -0700 (PDT)
Message-ID: <4b267dd1-2fb2-43d8-bac1-910f3fe8868a@gmail.com>
Date: Mon, 2 Jun 2025 15:57:50 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kconfig/nconf: Replace strncpy() with snprintf() for
 safe string copy
To: Shankari Anand <shankari.ak0208@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Cc: CAK7LNAQgb5u-+FEp1PjSxT7whNbW8YoiYt41m01M6yrt+=PXrA@mail.gmail.com,
 linux-kbuild@vger.kernel.org, skhan@linuxfoundation.org
References: <20250525164014.1558750-1-shankari.ak0208@gmail.com>
 <CAK7LNATZUUupYq88bhLKCQLdSt+_-9AigiNmbvsmXjOFcN3Gog@mail.gmail.com>
 <CAPRMd3=yWe_b9==eSCOrzC7v_Bnb2bQgxqrL+jCtfeSCm=Y3_Q@mail.gmail.com>
Content-Language: en-US
From: Franco Martelli <martellif67@gmail.com>
Autocrypt: addr=martellif67@gmail.com; keydata=
 xjMEXwx9ehYJKwYBBAHaRw8BAQdA8CkGKYFI/MK9U3RPhzE5H/ul7B6bHu/4BIhTf6LLO47N
 J0ZyYW5jbyBNYXJ0ZWxsaSA8bWFydGVsbGlmNjdAZ21haWwuY29tPsKWBBMWCAA+FiEET9sW
 9yyU4uM6QbloXEn0O0LcklAFAl8MfXoCGwMFCQlmAYAFCwkIBwIGFQoJCAsCBBYCAwECHgEC
 F4AACgkQXEn0O0LcklBgAwEAhdX5TbxGOmMhlJUi9AkDACN2ZemI8Tz2jSZPDlOQoE0A/3Tq
 SPaEkb6kvK4xw626+AUDrfIzwzBscgpkDo4zCW0DzjgEXwx9ehIKKwYBBAGXVQEFAQEHQNP5
 V2q0H0oiJu89h1SSPgQDtkixXvUvRf1rNLLIcNpPAwEIB8J+BBgWCAAmFiEET9sW9yyU4uM6
 QbloXEn0O0LcklAFAl8MfXoCGwwFCQlmAYAACgkQXEn0O0LcklCMtgEAuCcSolf8LBIB4WTI
 4YGKiN7qBXfW0QTbPO+bPXQLxfEBAJuoVm3BlyMHoNG6UEZ2TcqfV8k6oRqwr/c0IXwJqEkK
In-Reply-To: <CAPRMd3=yWe_b9==eSCOrzC7v_Bnb2bQgxqrL+jCtfeSCm=Y3_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/06/25 at 09:15, Shankari Anand wrote:

>>> Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
>>> ---
>>>
>>> Tested with:
>>> make nconfig
>>> Verified successful build of the nconf binary and usage in the menu configuration UI.
>>> Also confirmed no compiler warnings related to string copy functions.
>>
>> But, you did not verify if this patch is applicable.
>>
>>
>>
>>
>>>
>>>   scripts/kconfig/nconf.c     | 6 +++---
>>>   scripts/kconfig/nconf.gui.c | 5 ++---
>>>   2 files changed, 5 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
>>> index 67ee33fe16ef..42a78f0baf16 100644
>>> --- a/scripts/kconfig/nconf.c
>>> +++ b/scripts/kconfig/nconf.c
>>> @@ -589,9 +589,9 @@ static void item_add_str(const char *fmt, ...)
>>>          va_end(ap);
>>>          snprintf(tmp_str, sizeof(tmp_str), "%s%s",
>>>                          k_menu_items[index].str, new_str);
>>> -       strscpy(k_menu_items[index].str,
>>> -               tmp_str,
>>> -               sizeof(k_menu_items[index].str));
>>> +       snprintf(k_menu_items[index].str,
>>> +               sizeof(k_menu_items[index].str),
>>> +               "%s", tmp_str);
>>>
>>>          free_item(curses_menu_items[index]);
>>>          curses_menu_items[index] = new_item(
>>> diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
>>> index a1306fafd07f..d55518268f45 100644
>>> --- a/scripts/kconfig/nconf.gui.c
>>> +++ b/scripts/kconfig/nconf.gui.c
>>> @@ -176,8 +176,7 @@ void fill_window(WINDOW *win, const char *text)
>>>                  char tmp[x+10];
>>>                  const char *line = get_line(text, i);
>>>                  int len = get_line_length(line);
>>> -               strscpy(tmp, line, min(len, x));
>>> -               tmp[len] = '\0';
>>> +               snprintf(tmp, sizeof(tmp), "%.*s", min(len, x), line);
>>>                  mvwprintw(win, i, 0, "%s", tmp);
>>>          }
>>>   }
>>> @@ -358,7 +357,7 @@ int dialog_inputbox(WINDOW *main_window,
>>>          y = (lines-win_lines)/2;
>>>          x = (columns-win_cols)/2;
>>>
>>> -       strscpy(result, init, *result_len);
>>> +       snprintf(result, *result_len, "%s", init);

You can omit the format specifier of snprintf(…) when you use a single 
variable:
+       snprintf(result, *result_len, init);

>>>
>>>          /* create the windows */
>>>          win = newwin(win_lines, win_cols, y, x);
>>> --
>>> 2.34.1
>>>
>>
>>
>> --
>> Best Regards
>> Masahiro Yamada
> 

-- 
Franco Martelli

