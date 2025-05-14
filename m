Return-Path: <linux-kbuild+bounces-7103-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4039AB661E
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 May 2025 10:35:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AA3646380F
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 May 2025 08:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E1C21B9E0;
	Wed, 14 May 2025 08:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="daTGaeUU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B9E21B195
	for <linux-kbuild@vger.kernel.org>; Wed, 14 May 2025 08:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211736; cv=none; b=CWJ8xL6X8TlUZ5TiHlzk5X9r8wNk8QxoO3CBDIldHvqacSrUQhfekevevRStwSD8G5yd6zpnmq1i7PyV+90toF4karZNfH/iuHGLK0yqBHPIPr7RTQj173Jn1ncAPwmlyxW1MxE1NgfQmk53/x6sSFdeT22mlDFsjcu8aDvPFi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211736; c=relaxed/simple;
	bh=LnsVWhwJpBAkpZDh+52MQNw22R/I9maYDg8qpRVBVKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qrEkOdX+wjGAV5UGGEdhfOcPVhGlB1xBaNZHPEFlMF4jHNX91jwaZj+CyoAuZmJcvifVRMNk5qBPgCuxaI04ppksTQr3R2+lbLMw+T9un2Jpv/nLXvGO7prLq/Jdjzba1hi3XBEOGzgJdLfZ0nKp6MM+JqYWor4xrFCZXfkSqBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=daTGaeUU; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a1f5d2d91eso3748004f8f.1
        for <linux-kbuild@vger.kernel.org>; Wed, 14 May 2025 01:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747211733; x=1747816533; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V9zd+GoKgmj0lz1D+LN0r99cnHBgUgWB63kqIPzuCsc=;
        b=daTGaeUU6AmMCswrVFzQZN1mjZrlMIXH9TuBa85yg9Ria2TVuVhHfIbn/0i8kNyUL2
         xrovdREeqNFk9mRsJf/yoQOIchMOc+TjrWwc7ormUT673FVPjRAbsabyjHOPXqOfFpm/
         IcEvn3N8klO1XBsFzlxuGikxrhOfaxr33b+Ye8piOOaA7H4gD3Q8D5YlWAUWj1KQ0jXF
         LyLVvKZXnqrFq4onSKfU8ZeGd38rFm3R2IMoSqwog9ngVs40tbvowOtw4OOFkFwHR8+Q
         0ag0BDyqcBTIHJXX6xy6RXhjzB4O34TPXoDSLtO7n4olCEbmS/1VfKEU4DNrtUPQ4oi3
         95Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211733; x=1747816533;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V9zd+GoKgmj0lz1D+LN0r99cnHBgUgWB63kqIPzuCsc=;
        b=JbEGPPrBmVPED6ihCU/2t+ZXqoF4gmldbqlUMrPOG8k0+6r0pNLgggSosbiNE3euVh
         l6tSTg9rr8ZNSRpW8tCjf5VG1StQQFCrXNyLPAqGaDa3u1JrOlPoG0WCQ75TlYtkAmVl
         clOXRTTnJUZijuV6dHvVGkWekzl6Jd6CgPgplnOxgHrS65PMo62WAbyy0su0Twbhj+iF
         fZJ+5neoNLOIVWmgRZCl3QWo3P3AJjON0aCa3XKMWbnmC/TEumwK5A+W3yJkFFZIriB4
         JpyVuhjEgyvt7GMd7CK4hQzSxuEJAfMlflg821RTmGVBYuuq4ZBt0DJET1ppkClf6iSi
         wjhg==
X-Forwarded-Encrypted: i=1; AJvYcCXc0NNcniXwoV9TjVrl632+ibjAWvYr0j4TO0xtiKpS42+Sinkn15lcTt4nFVriFVfakuwQhccz8MM2FMM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSjlLP5NYYUyif/mfNsIhKeExGVNX659x9MDeDna6LWHcygv2E
	SQPPz885luBOaSNCNh49nFG/eJ94Nxfe+iZa2nggY6E3iQZkCl8GZd8uAKPfa3g=
X-Gm-Gg: ASbGncuWyBsHSOQr/Qg2KHAlJeaQSh+Y2KgoS/9FZunj0G6uQt4Rf8Bq3xhbQLeQeXe
	57K6hSpPXAjRgECUlnWZytWgEXonufauneY1gQpWI/MTMwYV9z1G0XrkCzrfy5pQRlQdm2bpbMi
	9y5dT2/WKQGuiDTW7OHo0Zqv/LlBfmYhW4srsAPDdEndyX4oTjtgOzdPAr3WmAP9F/RICU2VhXt
	PzAhSYzXumOpuUIBDVrzBnjnRrnZ+hLx8aawCPXQ5fNRE8WdOIh9l50NyYJG+1AlVkL4fRAm2z1
	3Eopd1DgcfNGMNp7kxU954/UXRXvfO5gYgYp45EJ/DBUr8JzjunvcA==
X-Google-Smtp-Source: AGHT+IGT6wMyIUernPhTKllof9XQpCI1zQrbycT2cwRsu9zmtZYLZ5dRauNiPAUk32i9JzaAtr/pSg==
X-Received: by 2002:a05:6000:2481:b0:3a0:b550:ded4 with SMTP id ffacd0b85a97d-3a3496a47f9mr1500267f8f.13.1747211733319;
        Wed, 14 May 2025 01:35:33 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4df3fe369b7sm6319632137.16.2025.05.14.01.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 01:35:32 -0700 (PDT)
Message-ID: <eb13d6b4-3c6d-42e6-ae58-bb4454297c5c@suse.com>
Date: Wed, 14 May 2025 10:35:23 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] module: Extend the MODULE_ namespace parsing
To: Peter Zijlstra <peterz@infradead.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com,
 samitolvanen@google.com, da.gomez@samsung.com, masahiroy@kernel.org,
 nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 hch@infradead.org, gregkh@linuxfoundation.org, roypat@amazon.co.uk
References: <20250502141204.500293812@infradead.org>
 <20250502141844.154517322@infradead.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250502141844.154517322@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/2/25 16:12, Peter Zijlstra wrote:
> Instead of only accepting "module:${name}", extend it with a comma
> separated list of module names and add tail glob support.
> 
> That is, something like: "module:foo-*,bar" is now possible.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- Petr

