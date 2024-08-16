Return-Path: <linux-kbuild+bounces-3041-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A5D9546BD
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 12:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0AED28604C
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 10:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27A4F191F77;
	Fri, 16 Aug 2024 10:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OjvM6LGN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617AB190466;
	Fri, 16 Aug 2024 10:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723803840; cv=none; b=IMUpjsY7tnmEMmRHNFfaVNS0ObVRIWX26D+to3CQuU76RwF6aq0nq58OhmR5VpDfthWIUCj7yN9TXuDJRYb16ZiIGfPp9CgDG+OESx9t6GGKVKbL1nN8wyPcrwlTm3j4TkFga5Ht0cpVilsGAIrpHnoMU6S0Y/2wRFrrd2KVQJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723803840; c=relaxed/simple;
	bh=eR6g0kICvaWDCim7XMZTYhHqSBbWnikawdT2zlhEDd0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZTj8WPzdXuYjUSStDbo6U4nj5P017/wSdkaKXJiHZynrEX2USTPIcNt+EkwIeSNUv6kmuEGLJGAhDWP/wbbPUD1VX8pJczqAOoQjDI371Wy6t86hDsJxCjt2k68wuiLu+00JjVJfcZsRSGenBZ6/o+esefuFQkC3mstnR27sdZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OjvM6LGN; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4280ca0791bso13263805e9.1;
        Fri, 16 Aug 2024 03:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723803837; x=1724408637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RpRJjd4BRhvinkPXpnKisaEyE+ndcG8cHLpX7n8m0n4=;
        b=OjvM6LGNCyL8cyIH6kDZbS7e/K25PMeOImwEhK7dtRA80DxX0YkJJJxPK2HYulfiub
         RbBPaBU2lOeSKPiLB92n504ZhvmCXIdSk6apTI8ZYvYa0KHVYJFO/NG5Ptyaz+Gb0/Jg
         9ZD6RyjQGtgPuXElK0DhIsMqLyWVLruWoD2b/P13Odaeqk4qmg46K0asrfhuTU7b75K0
         VqWqtoVrRoxkQ4HXc8LjcsIlhvMQKfEpBQpHKWN/qSDsH9VCtgwgirlpyw6e5eH14JE7
         q6k8TjgXLn+/lKFCGU1jh7wZ6QN8Wa0RFjH1JB9BIiHBTi1uH5L5KwUxD0vS8fbT5itg
         7UUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723803837; x=1724408637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RpRJjd4BRhvinkPXpnKisaEyE+ndcG8cHLpX7n8m0n4=;
        b=KOWAQMfkiSIzFl9jzoiqdxskG6mEun8n2YaG6VAyPCqm5MuJV1WJBxm4TjRkxRbfcq
         6kiMNd2Xl63KVjkn3mivMzzzqSYbj+Yhe/oiZyI8knyqEp4BCqjD6uepjpszLq80e5cG
         IXSgJAPR8qSXNBN87q9S2op7b6Gg4Q1v1TtWzcH0mD7AHkkD9pT0hOGH8TEKXyU7JOYs
         B3HWU7xwWpCGNSHNyVr1MUhF9qNcP4/KPw92oNmC8dtufsAn7FN5J6zrk8/p8PU2aFK4
         hk2sgaHEe6KiVnVR4gRzGHEPbnzp0O0a1PoHKtR9ir7qvax14uqO1DGe+tZaky9E0w55
         zSzw==
X-Forwarded-Encrypted: i=1; AJvYcCU1nQ/glUEJUpVhGCPriw0bRgC+iPo/DHiNx+Zhea+sBRY5j+73Ph0id4EMQTapwiYtceYqKsUgP6Qr1tYPHsyHadsegEE5pAmTJvCrExsOSKlQOPlTCyojtvi8FAACjOBZgSd0/fBe6MT8
X-Gm-Message-State: AOJu0YwYQUKOUCVELl8zSVRwalms9CYd1AXO1qFudQF0gtIomfgpySon
	tgZkm8+nvBwIRo2zRcp83FDWpt04kC+atJ8Pn/FYofzm0RuSqRV3
X-Google-Smtp-Source: AGHT+IGdKD64cR/xI7my6i60xD0kP5WvZgIMfaqvwl/vY+iJ3OTfh37Y0LtkOgldyOgX4BG51sOG3Q==
X-Received: by 2002:a05:600c:1c24:b0:427:9a8f:9717 with SMTP id 5b1f17b1804b1-429ed620183mr15765455e9.0.1723803836486;
        Fri, 16 Aug 2024 03:23:56 -0700 (PDT)
Received: from localhost.localdomain ([2a02:908:e842:bf20::c7d2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37189849831sm3318522f8f.30.2024.08.16.03.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 03:23:56 -0700 (PDT)
From: Ole Schuerks <ole0811sch@gmail.com>
To: masahiroy@kernel.org
Cc: deltaone@debian.org,
	jan.sollmann@rub.de,
	jude.gyimah@rub.de,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mcgrof@kernel.org,
	ole0811sch@gmail.com,
	thorsten.berger@rub.de
Subject: Re: [PATCH v4 07/12] kconfig: Add files for handling expressions
Date: Fri, 16 Aug 2024 12:23:19 +0200
Message-Id: <20240816102319.21739-1-ole0811sch@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <CAK7LNARA2W41X2n97O-=TXYPrmTsGqL-aMczPHsB2T_Y3QOGrA@mail.gmail.com>
References: <CAK7LNARA2W41X2n97O-=TXYPrmTsGqL-aMczPHsB2T_Y3QOGrA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 8/12/24 10:46, Masahiro Yamada wrote:
> On Wed, Jul 10, 2024 at 3:54 PM Ole Schuerks <ole0811sch@gmail.com> wrote:
>>
>> To translate the Kconfig-model into propositional logic and resolve
>> conflicts, we need to handle propostional formulas.
>> These files contain many functions and macros to deal with
>> propositional formulas.
>>
>> Co-developed-by: Patrick Franz <deltaone@debian.org>
>> Signed-off-by: Patrick Franz <deltaone@debian.org>
>> Co-developed-by: Ibrahim Fayaz <phayax@gmail.com>
>> Signed-off-by: Ibrahim Fayaz <phayax@gmail.com>
>> Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
>> Tested-by: Evgeny Groshev <eugene.groshev@gmail.com>
>> Suggested-by: Sarah Nadi <nadi@ualberta.ca>
>> Suggested-by: Thorsten Berger <thorsten.berger@rub.de>
>> Signed-off-by: Thorsten Berger <thorsten.berger@rub.de>
>> Signed-off-by: Ole Schuerks <ole0811sch@gmail.com>
>> ---
>>  scripts/kconfig/cf_expr.c | 2594 +++++++++++++++++++++++++++++++++++++
>>  scripts/kconfig/cf_expr.h |  296 +++++
>>  2 files changed, 2890 insertions(+)
>>  create mode 100644 scripts/kconfig/cf_expr.c
>>  create mode 100644 scripts/kconfig/cf_expr.h

>> +/*
>> + * convert a fexpr to a pexpr
>> + */
>> +struct pexpr *pexf(struct fexpr *fe)
>
>
>
>
> Not only this one, but more descriptive function name please.
>
> "pexf", so what?
> I do not understand what it is doing from the name.
>
>

Could you give us one or two examples of what other functions have bad 
names? I didn't find anything as bad as pexf() so I'm not sure what the 
expectations are. Thank you, that would be helpful.

