Return-Path: <linux-kbuild+bounces-7102-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A28AB6614
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 May 2025 10:34:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3A083BF61E
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 May 2025 08:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739E221CC41;
	Wed, 14 May 2025 08:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SrUIcqaP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356E427454
	for <linux-kbuild@vger.kernel.org>; Wed, 14 May 2025 08:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211677; cv=none; b=NoW8LIwYy3c8VVu8syW0/+/mRJMbzSHdwCkzoQhrr6GTlzG9dzVNUfUouaA4koHyXDrU9Gnx2S4HvcN6HTvPOIdvP1TuMLnJyebvuzkNLe2ETtnQXB6FSPERT38bSSJHtp3B5RKz3ViRSfCXdvzYwTDlnW9tYOHYL9lS3Tfqj5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211677; c=relaxed/simple;
	bh=413HM5eboYj1vCQAGypKKKAbvRddV4u80mvB/tL2F9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OzGM9JmtxPi2DU2knJzVRmt5zIrbNdOhU8Nlwg38vrdfc49wM997BXDgwaxBRsg0erPwS7rQ40f6nrK7xCWU3g7WO5rbyZ0iNT1RUPLiOgpibaPFmZsjW/cr09LuvBxCnUIbdQp5EZVhT3x0YF/9lMza8NsUREq9QeUwRsivQ84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SrUIcqaP; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a0bdcd7357so4612595f8f.1
        for <linux-kbuild@vger.kernel.org>; Wed, 14 May 2025 01:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747211673; x=1747816473; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pmPxzvplp27sf0Mh5TNQ3UmGJf69Of2vzLV4ej7YVkA=;
        b=SrUIcqaPODojagnPoRW+EgNHSzbIpuBYPruB6ViPMGqoWp97FIvecSlIJ9uDylMavK
         c+Gv4QFDYTXd5PTeupnbsBREDXj15BaTcDV9YTCvz2N98yQFV3v6M6oqsFqpsPkIslFJ
         sIHjtvuuwsVzmNrfa9xXRCLBUL2k1YQ3EAl1bP0fBAgdEAVHsZ04GzYB0WHio/Gdv0PC
         eLErMCCqLjeyEI6VCzzS+rKWhX8k4Uydyd/aCZLbhk4js22y1x9+oUULlKNqaq4+/l/7
         4Xu2OMObHFjrvR4UEADeMmgGj0+2CoGpO5yUOvVIydLvWp8HmUq9LGZPHCiHNfI4Rs5X
         xrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211673; x=1747816473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pmPxzvplp27sf0Mh5TNQ3UmGJf69Of2vzLV4ej7YVkA=;
        b=g94gcPGBNUwTzTUg0oHNjTMZUZNbxqLE8ekUYJq3/OT3xmdclprBmBfNBi4rAIBqkw
         5xblX3keaGfgX2o6/i8fGQB5SPic7+hw14JB5EjLDmMlQHl1T9K8koAXbyCz4g0yWl3K
         Vd0jM10IDY3wu1ubPcbPiMxHkOFcMuxOH/7UfurPqAqNdgHLH+8zEVzK0I3pYNMt/7KH
         wkkqQlbm7Kq6FPqJDBQ480L8ula0bvL15nc6OqL4O+eCYElkCxx5b2+Fa8X0W97DaEe2
         +wURS0lFLhlZqu4VqOIf/pLncQpfP7QgaIe+MXxn1QKG1X4v3VwXLqRMWG3iea9w42Oj
         JzyA==
X-Forwarded-Encrypted: i=1; AJvYcCVTlPXSsdKkIqxmAO+oJBP+mD5FdMFkCJ7L/5HlfgPVnwNtm4Nr7y7UtMhXH5FEalV8ZDBeRPhPBAH3EFI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2QatndIY1zgpKAb6H8YAHBhoSfHyToZfrxZxCaUCOIcRoh2gJ
	GdihJeTGln77y1KfuLFuH5LJKtSokkoYQqsV1SAsN/0stcxjmRNsugobTJZlPZ0=
X-Gm-Gg: ASbGnctobUfle7jepqIvlFYzYTpRIhjjy/ST4Bo1FLnUpUay8EwBBprXxv4t5dx7UlC
	poGMD6M+qp2+QAoVbpZpewS81717c0g/HjmuvDhpTWD2hwmI0VfRXDf+mSVEkqLXN/lGpWL7mJW
	euHj7P67ACxU5xtT7RxT3VO2QDz0TiM8L0neDPgj19twYsEqZIef+7mlhRfby8sm0kS+gDeqX6t
	8ZN2KGccnFnt1JsQyhZ4EhcgDOP4oYpUy171tLMU1Fu4sU7WMEZ18t4YoA3t3NZCpe8dYji4wa6
	cjhlz0v269uBKT/a6taJJfVvRqOWFNYjfPe0E1We6iolIQmowDeumg==
X-Google-Smtp-Source: AGHT+IGMrizPwMYXPEGeYJfqWtlgiQDVjgsMQKbEsCq+MVhFWOKzPY77w7J6frRmGyePbOUN4M6Vhw==
X-Received: by 2002:a05:6000:2dc4:b0:3a0:bb2b:14e3 with SMTP id ffacd0b85a97d-3a3496e7095mr1945171f8f.33.1747211673499;
        Wed, 14 May 2025 01:34:33 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f6297d9esm8160828241.28.2025.05.14.01.34.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 01:34:33 -0700 (PDT)
Message-ID: <81444b38-e0af-4278-89ad-e25cfe08179d@suse.com>
Date: Wed, 14 May 2025 10:34:24 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] module: Add module specific symbol namespace
 support
To: Peter Zijlstra <peterz@infradead.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com,
 samitolvanen@google.com, da.gomez@samsung.com, masahiroy@kernel.org,
 nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 hch@infradead.org, gregkh@linuxfoundation.org, roypat@amazon.co.uk
References: <20250502141204.500293812@infradead.org>
 <20250502141844.046738270@infradead.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250502141844.046738270@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/2/25 16:12, Peter Zijlstra wrote:
> Designate the "module:${modname}" symbol namespace to mean: 'only
> export to the named module'.
> 
> Notably, explicit imports of anything in the "module:" space is
> forbidden.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Sorry, I thought this was already reviewed from the modules perspective,
but I'll make it explicit.

Looks ok to me, besides the already mentioned "strsmp" typo. I can fix
it when picking up the series.

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr

