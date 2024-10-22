Return-Path: <linux-kbuild+bounces-4229-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C19D29AA148
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Oct 2024 13:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22A25B22693
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Oct 2024 11:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC60B19B5AC;
	Tue, 22 Oct 2024 11:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cffjGT7C"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F9E19C54C
	for <linux-kbuild@vger.kernel.org>; Tue, 22 Oct 2024 11:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729597370; cv=none; b=YZdeaybQ9JuwkyKycn5bp5w3VAZzr7/tVD2A23qgLVj/QuBopKYj21o2yZhmmafw+9NAOg6Ixam5R7nuKPewaK/Y4tdvvakzBGzwinmOflfmvE1b1rCdr84Q5fEGg5jXYtgsYDRB+7gljaLX+au8gyG8pajKu/Zya7C8rdEHZqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729597370; c=relaxed/simple;
	bh=raa66sydrVS7SYiJ0GgKYuUMIZ/xbMw6qo8atNjsO8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dyBp0oBDjiWfJoPT3lK/ScPtkzQSBWgnP/i6LJrjnSBLlCa9tAspSl9E4Wq7tg6xtTvpudTjN37cuVRuxaew7UvVvd8eTQbzixlwYuZg3dBE73jQM2pIm5mQPVEj60+8u1GpOxbt+Y4HzSwjCvr7avpkAYyGR2+QMPxLHo9LWvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cffjGT7C; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9a68480164so527468466b.3
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Oct 2024 04:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729597367; x=1730202167; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8b6GJXioy/QHHMfPsIPiSHRGT4MhlfXPQwWNMxqLwkI=;
        b=cffjGT7C3sFd5RxxcIaS31FqZeB7ognz3qpOyWbztqtehNtX9QrPX1yTHr6dh6SLiW
         9qFK6w3Za90hoBxMl0TojlyY937xy1JHH7w/FfR5Vr0nDF02og7PdR8yWXUh4JkXoV8L
         bweBrzUqvudH3Q0rTUm+RIhZyTQb9yN97MH7sz0Z6KM/JtRvsjEamz0UpDwWrX5ccuE1
         PY8YZVNU/bc5vEzOqYgAsSovUOTrX88uWcYwwT5cLVHZiXZEQZvOegCNt4wfqgBMkLFB
         whYr4T0fIEK5u16e6Zt45W46FoR+lwJPwwUlBn+J0Jt1iGC6uDVeJsyLdGvpozp8/ZuO
         rt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729597367; x=1730202167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8b6GJXioy/QHHMfPsIPiSHRGT4MhlfXPQwWNMxqLwkI=;
        b=UkcXPOZXmvMKAWAiBmw/RLmV7fbwoMWEdthhlFfGq3UnTshQfTN5Ecj6cIXHMSbpol
         CNB/EjTwrJTVN2D/yWLPQJFQ+7YrcK5IyZZ2nwuGoYqKk7gQ2D34aVgWAGBApTgyufCZ
         p5brKpehIJIzvk+4VXnSwbtb+eOxsouwMiJhbBkl2KM4Qwoynl5ykz50jmTqBcWzL3xa
         U9rwT0H7niRy7O6L/KD3FgeFl2H7ZfojPDWFh7yGUPlDAu22hJeTMLqb38ttb3JI1VY/
         +xocCf/Z9JhvP3XTe2831j0YWSvUYs+kKahYKsPffCnns8w4w0csl0qaf6nS2+DFWasI
         bOtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUY4w2kZjIZq+A0IhcHo4t9djs3mwMGg4MjKvr4tgKZ6xiVqnEyf7hFKqW0LeRJpq61EXsH7+O1GzgohxU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXYXth29DdkHhEzLvmNkgd6+eJdd2d5a639Nax/egtV+EWP6XA
	stCz3Btl5fGStHnlKXtd0CyEKA9SaC3QuGj0KRP1JYk6dM1x3w88XgM309xpwIk=
X-Google-Smtp-Source: AGHT+IG2HVAkARznKGeXSSOz3pYHmzdRrakg/LgoenOtPU5eMNDOO3eQvdGmwFfjp7NcnbHTBiLBcg==
X-Received: by 2002:a17:907:7d9e:b0:a99:f8e2:edec with SMTP id a640c23a62f3a-a9a69a7dc95mr1691628266b.21.1729597367082;
        Tue, 22 Oct 2024 04:42:47 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a9155a1c9sm328599966b.129.2024.10.22.04.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 04:42:46 -0700 (PDT)
Message-ID: <df619b5f-998a-4c6f-af80-b2923264d16c@suse.com>
Date: Tue, 22 Oct 2024 13:42:45 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/19] gendwarfksyms: Expand structure types
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>,
 Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
 Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>,
 Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20241008183823.36676-21-samitolvanen@google.com>
 <20241008183823.36676-30-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20241008183823.36676-30-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/24 20:38, Sami Tolvanen wrote:
> Recursively expand DWARF structure types, i.e. structs, unions, and
> enums. Also include relevant DWARF attributes in type strings to
> encode structure layout, for example.
> 
> Example output with --dump-dies:
> 
>   subprogram (
>     formal_parameter structure_type &str {
>       member pointer_type {
>         base_type u8 byte_size(1) encoding(7)
>       } data_ptr data_member_location(0) ,
>       member base_type usize byte_size(8) encoding(7) length data_member_location(8)
>     } byte_size(16) alignment(8) msg
>   )
>   -> base_type void
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Acked-by: Neal Gompa <neal@gompa.dev>

Looks ok to me, feel free to add:

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- Petr

