Return-Path: <linux-kbuild+bounces-8136-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA84BB10CD4
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jul 2025 16:11:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 311E8163B6E
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jul 2025 14:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B23872D5C97;
	Thu, 24 Jul 2025 14:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SVnABKCZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38CA2D29B7
	for <linux-kbuild@vger.kernel.org>; Thu, 24 Jul 2025 14:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753366200; cv=none; b=PeZWH94WwP5uaLFWzsa/R5ZVgpwyTmtosRZDUtRdkh2OdCA2Kcfbe4MMeLyp4+w2pJcqFyhMWSEm0LUf8HZx83yKM+QFrSfdWA+GhYYdmdZVY+LKBt9fRHizd7lSl0/SeUL5NEFiHKo9XjltdyrSdu4zOg5A0bOHYJSbI2O8ris=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753366200; c=relaxed/simple;
	bh=h+K0vmC3/TCo0nSo3dM3ozTwdyqP++usnAb3Eyga7r4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LmElx6msMf1gqyzJNShTXZ7GdoNIqMt+ftbhhdMDvPKuL9vatOxgr4oB+G0RBnw2+cKNBTwdyORjeLCjqGXIBxqmoi+lweUwE2/q15ENUyFOUsmogBOTrx33gW6oV+hkjHBFmzFgILHwh5jSRPK+tx9Cos7dA0NmppS5eWZI+r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SVnABKCZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4561a4a8bf2so12034605e9.1
        for <linux-kbuild@vger.kernel.org>; Thu, 24 Jul 2025 07:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753366197; x=1753970997; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FtkvbalbhW467Ci/TrHI2JYa3ewJ4y6lRxO5bgqakFk=;
        b=SVnABKCZJwuYkKSpYod2UM6gnXHDjLv5bpPspemiWXtdO32rcxuAnwj48oioQlHGwT
         KmXV1IWz5TrJXg760IhJ1N1QmhYYcHjqff12TUHLs4HcBTxDOZNsgwQEv2Ooq0M5ac4J
         lzPfH6c+ZwoWEMRjHEcF58dYb08mLJFo3j6NOjpeuR03tj4x1AgdIeXNxAc7Z4aoRItq
         jM4QBHx6zmNjFCu3a/JZ+55BAX1idWLE0CWAT5X1G3f1u9yqbASTckbqUMiTAGri7QgU
         T7ewQpOnqYuckoyTvo3fMe3wEJbOwkgvg8NTEwQ84r7pyd1E7dJaa0n4sUsAXifvk0fw
         I6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753366197; x=1753970997;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FtkvbalbhW467Ci/TrHI2JYa3ewJ4y6lRxO5bgqakFk=;
        b=eAKApiWBewPFqBtEUrjSH82qu5fJ8YRaR56/lIqvcySDqlmZBboUm8b/MQFBqymf0o
         Vtl3/D6xKZjqcmnHe6AXL1k5prGlZeqiYqTNahL3BYJDvjN5z8pCz0o4eZhZEayZNUDW
         gwP0/URuKgP1BbceZ/IXOyWBbay4AhFK0Wm4oAfiaq64sNQAsTscIKllwAQt+XKgQYtP
         XrkEKwAfe1Cy9XxZ6Qi5hIAfa2M+lW/nog71Zhd5IaWO0OCh1mMMdJp8sS0gQkkEzGED
         iuLIV1NdV9hfYOAXQcPvM5mD59wv1cn99UnOA74ySGFiio4B8IiY6pYiyrCwgtZ5gQOT
         ivCw==
X-Forwarded-Encrypted: i=1; AJvYcCU7c7qxxD14RXxhD9+Z3mF2nZuj9IMlDZqJOFf8+WaXpZcez/CTGHV1O+nBsNJPuqpF5n6z0i0Go/of1+k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcWR56Kme5Hhnus7eydmK+UxXzI6Z9Gg+PSDlfYFP0bZPp7LYH
	/QXIwVstxe6qRw9n4PdLA/YIH/OshZ/QrJqGRksd+/KgSecqkVo+zPV0Ggugmu8ilQs=
X-Gm-Gg: ASbGncvJClqq6SWD5DRBKnApPZJBJbQFZf5c42rqywiEs1ypn/PjiEeA0n8Yncr+Tfd
	7cfyo32p2OSbhwzcLNH7W0tEVdwFuU+q1flpCHPLSIVxNaj9xSBZchBt64rC50rObNiFlgx9bQS
	7fvoJ0h9qtECkImYx3qe74cRwANZe6HvyiEz5sKLgsvbYkvYK+5qc2Xpmvnm8wu4snKHJYBodyC
	slriEs2/eTGQ9GXxw6rXvWgQKg8BaG8eQ4i0Qw+/TDCKuny9JUybaomnu6+yZt6NJpaUTJnLBzw
	AZoDTH45wIWziTSUEwnDZs2CTVsIzncx2yDxNrqwNUAJPXdhLFAbJ4C7z6ravG0UoxvT9k4o/M6
	R+XgLHqt8bkwa1WXQm09KvKXpsXqiJd1jWjLtGDyANOcju0BPwtgtioGrrqsQjN5YrXKKiOgQFn
	Y=
X-Google-Smtp-Source: AGHT+IEzBJZjwflpIGZm+EhCnzacJZTC2cyh5NeZ7fWUM4qCv/j+DuKgDh48awMiy/In3FsYO7BG9A==
X-Received: by 2002:a05:600c:529a:b0:456:26ad:46d2 with SMTP id 5b1f17b1804b1-45868c75dfamr58753125e9.6.1753366197052;
        Thu, 24 Jul 2025 07:09:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:e2d3:d328:dc00:f187? ([2a01:e0a:cad:2140:e2d3:d328:dc00:f187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458705377dasm22037195e9.4.2025.07.24.07.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 07:09:56 -0700 (PDT)
Message-ID: <d02c400f-d159-451c-b4ac-745e74986591@linaro.org>
Date: Thu, 24 Jul 2025 16:09:53 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 06/10] pinctrl: meson: Fix typo in device table macro
To: Alexey Gladkov <legion@kernel.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-gpio@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <cover.1753354215.git.legion@kernel.org>
 <c47f5e1ab68248cbc4d51dcd822829da8857ea00.1753354215.git.legion@kernel.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <c47f5e1ab68248cbc4d51dcd822829da8857ea00.1753354215.git.legion@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/07/2025 15:49, Alexey Gladkov wrote:
> The typo when using the MODULE_DEVICE_TABLE macro was not noticeable
> because the macro was defined only if the module was built as a separate
> module.
> 
> Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-gpio@vger.kernel.org
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202507220009.8HKbNP16-lkp@intel.com/
> Signed-off-by: Alexey Gladkov <legion@kernel.org>
> ---
>   drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> index 385cc619df13..95525e66e5c0 100644
> --- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> +++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> @@ -1023,7 +1023,7 @@ static const struct of_device_id aml_pctl_of_match[] = {
>   	{ .compatible = "amlogic,pinctrl-a4", },
>   	{ /* sentinel */ }
>   };
> -MODULE_DEVICE_TABLE(of, aml_pctl_dt_match);
> +MODULE_DEVICE_TABLE(of, aml_pctl_of_match);
>   
>   static struct platform_driver aml_pctl_driver = {
>   	.driver = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

