Return-Path: <linux-kbuild+bounces-7277-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F92EAC49B6
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 May 2025 09:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D06A3A3BBD
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 May 2025 07:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62978248F7A;
	Tue, 27 May 2025 07:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Gp55y0tg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3284C248867
	for <linux-kbuild@vger.kernel.org>; Tue, 27 May 2025 07:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748332551; cv=none; b=YQpQZTbRGQY7H6u/meQR/ZCQF497SWDeUx2UZAtB4jr2p6NszZtt4JtR1AUn0YTx1M/TXXhHT7Y8D/ok7U5IhhoHeJMKFSLyfJ3T8ba/1SP8t6acIeeSr1/Q/uDiwLzSK0GvLQ8/LyJNtoDZL3F0uJAUTwI28CPRu8AapJ+DXQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748332551; c=relaxed/simple;
	bh=DSqmTgfY7dHzFTdbczYIQKSSfxjU6gLpEJ4Vcv0tVlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CSzEc3Ikh1wkbqMRock8FW+p+y5tWBGuAWueWGy/X8Q3wzAX6OGnGQA2gi7o4E8GF66V7dXu+sxIg9dZP7LC2MINy+IuG3P6VwbZhovCZWbnYpee39FQvxddLfQQszB7tWCxJa9kH+ErTn3ROz/+LwpdlKEH/1hBvPQp52SWzpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Gp55y0tg; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a3673e12c4so1926008f8f.2
        for <linux-kbuild@vger.kernel.org>; Tue, 27 May 2025 00:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748332546; x=1748937346; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H4V1pVAjxvwYLOelIoYLXWbI8rf88pC3QzgaJmIacw0=;
        b=Gp55y0tgzlodcl+PCJ2VbvUuQbYKR4cb4OzFCMyLmasyu0nm2xAx54OwvaEYdoLVAI
         xboCyqEigH85EDbMN8tVBdkuKzhKErdNW8UAk3eLJFNZ/ixi9uGbDWRWUMWa95aQ0evv
         KBAXd4v79YlVQxXQGGwH6Zel2zIboVDb5yc9TJQYHZR0mCkvgjThJeIT8pJlLbqrpAPK
         esNDyYJRGRSTYuiM8EOeD9G3EdFhqTwGoOyEF2WycYyQTBsKaMuqw1+VWkzGMRHJLJae
         isDWlQB5zjnDwIjjnD7T+7Kat6R9TvLvi+Zfi2RU4h+1ROLcS+nvqxaI/759YyVU+NEn
         u01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748332546; x=1748937346;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H4V1pVAjxvwYLOelIoYLXWbI8rf88pC3QzgaJmIacw0=;
        b=Bb0lvU1/Hni9oz2mCVMlNlGVhtBWl3b7xYWhoCv32xwJaSaq6PHm4w0Pa+hjuANrac
         GDDvkGN4SGY6Kai2dg5vLg+TDyb7nVAsFehAVG5cskn1kay4nIgu+rI0NuvdWv9ihuJY
         WCpTQgNnlGx5OVNH9y+E/Qtib2MGca46OqUqz4CX4uFJISRO12voGmFI/sufJ5Q6Fqf5
         8FiwoQOX5ITfyy/54G7vK/UoDlV0K9IjJJb0bgxqGxV7zhjCaz6jY8jg4aSvLxREEFPQ
         qMAmtDkQJo+iDG18Razn+O1PeTivtSkXDfK8Rp57sQV/6sW1gl/kGI/iJyjnNDzUtlio
         KwyA==
X-Gm-Message-State: AOJu0YyCQF7PIil+NyEfss0f4BAMxC5Wm74uPtPu97qSksVTlwbAMAJ/
	vm4W06BuCmHezUGraodkCYXdReuhuXKrou5cZQTNwD5msyphJk24FFc0+/A+1KuJeAE=
X-Gm-Gg: ASbGncvL/c88tkIC/Udh+ZBqWzcMALYfWma7FKMjjgop7K6/WB7IwgEbA7OcbJL8QG5
	Ex/8f2efMQaReGtMCmVBazGQU9HfP4Za93vJYt6XxSl9hQ+L94+t/0gNB0GcgrClzFk3WovQygo
	ndPKgVqmYXvlh9tQrkB2TVEur0tH8gr4nudYWjGe2RCqlntrVruezciyNymDShzdDwGiVEr1jF7
	V0bHoBmgHsvSAFUdJ0r4hT/ZmMiQK0hZV85ZTdcrkd68j2wJpD9YlP5fTZNnnF+01rbic49KiMU
	jbwg/0mqANU31PzGswWY2XJqeMKvUqT8wdQI+1A+OKyNlryT1kR3cQ==
X-Google-Smtp-Source: AGHT+IFUx0JRQGioBEzkta845pUECy34/zcY7WGKeuIMwmVfEbYP2vIkm10xwit2X/PhsJzPp3ehjw==
X-Received: by 2002:a05:6000:1785:b0:3a3:63d3:369a with SMTP id ffacd0b85a97d-3a4cb4602a6mr8243909f8f.25.1748332546433;
        Tue, 27 May 2025 00:55:46 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d4a24429sm6974875f8f.36.2025.05.27.00.55.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 00:55:46 -0700 (PDT)
Message-ID: <e31cd61f-cd64-41ff-8111-95b871534b2b@suse.com>
Date: Tue, 27 May 2025 09:55:45 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] modpost: allow "make nsdeps" to skip module-specific
 symbol namespace
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Gomez <da.gomez@samsung.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Peter Zijlstra <peterz@infradead.org>,
 Sami Tolvanen <samitolvanen@google.com>, linux-modules@vger.kernel.org
References: <20250522071744.2362563-1-masahiroy@kernel.org>
 <20250522071744.2362563-2-masahiroy@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250522071744.2362563-2-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/22/25 09:17, Masahiro Yamada wrote:
> When MODULE_IMPORT_NS() is missing, "make nsdeps" runs the Coccinelle
> script to automatically add MODULE_IMPORT_NS() to each module.
> 
> This should not occur for users of EXPORT_SYMBOL_GPL_FOR_MODULES(), which
> is intended to export a symbol to a specific module only. In such cases,
> explicitly adding MODULE_IMPORT_NS("module:...") is disallowed.
> 
> This commit handles the latter case separately in order not to trigger
> the Coccinelle, and displays the error message:
> 
>   ERROR: modpost: module "foo" uses symbol "bar", which is exported only for module "baz"
> 
> Apply the same logic for kernel space as well.
> 
> Fixes: 092a4f5985f2 ("module: Add module specific symbol namespace support")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Looks ok to me.

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

Does this patch make the following note about nsdeps in
Documentation/core-api/symbol-namespaces.rst (currently only in
linux-next) obsolete and can it now be removed?

"""
Note: it will happily generate an import statement for the module namespace;
which will not work and generates build and runtime failures.
"""

-- 
Thanks,
Petr

