Return-Path: <linux-kbuild+bounces-4090-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0246599CCE3
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 16:26:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B86D72822A5
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 14:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90E9D1AB50C;
	Mon, 14 Oct 2024 14:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AiH2KDdv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E45B1AAE08;
	Mon, 14 Oct 2024 14:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728915974; cv=none; b=N+Mmx+C7/PwnlunENMZRw3exByXKUOTGY/LQDLfucHrSn1iBqK94A57BIviCn5xEnXXvg0I1nn+vavhJ4F07U5far5E5+vw6kSBpTOiRWKZXiGjwQAwgJST0zdMUuFjAFkc7P+ce4J9DzOE6wYD7SXfnplYd9+Koyo4nIJWcyQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728915974; c=relaxed/simple;
	bh=LLkv87xy+203XARJ82huUVgbq0i4Rn77CtkC6ufSqqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Igrr6mz22Z85xiIQVjeUpo5TR30uLCYIBok0/8grrWnycdD8AdOYktHjQ3CFPud1gWGHnFGttPsbNC8kVMMITsKBSZJrQi9/NwDCveeYTsPH22+Bfvg2zgmqhqSSZ4KpvN5DeUJTi4iURSkCtO9lscDVWTt0U4Lo6+gDBwierdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AiH2KDdv; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e2d36343caso32245517b3.2;
        Mon, 14 Oct 2024 07:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728915972; x=1729520772; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LLkv87xy+203XARJ82huUVgbq0i4Rn77CtkC6ufSqqI=;
        b=AiH2KDdvPsPA5Zcv541mU9ou58L6RS+QnrMjd35Ka6tz38KoPc+dpBcPgb6IueM3r2
         bqWgBUSVI8Y1z8H8N6oojgA8fgMfU6QLR1RT0yNoM7WQK68U3P+PGLMR7JfyQnk1zqjg
         Pn6AkZP2obb38fWCPsT9e7IQlUnJk7z3TE5zOzTFmkb/toU2/2ZvZqtJh1pOk7VIuc31
         Pn8aaQxQQA+6uqL/KTljkBpoFR6+B8ab5/6MHsaqJLdz4OkvqzA3KaZITVXkNSrPS97k
         x6I7YJycCWwKl3JMdWZLg5YzRnGulB4OtDkyODN1z0As77DdmCsk26JSRftu0h0SpaMD
         gzkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728915972; x=1729520772;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LLkv87xy+203XARJ82huUVgbq0i4Rn77CtkC6ufSqqI=;
        b=XQnBLqk5XtSmiUnouOsyUbmXugQbA6IZ2TFj6BPmpX/i8Buqu5wQ72A2dZZgFKreIR
         eVvhuCoO+iGLqlJxTQnIDkKWgEw+gHuO6lrkyr++Nja7NkVi5ezNu2DYMy0+yNAwyLLo
         9pTPjbhy4KosspiLM1tn7rvt8nXK2iF0RYRPi1ZgZfHpMHShJ+8VoV8n2PjVFZF/ZY46
         z6qQ8OzspOApSrcuoxczxFgiLvHaVK5JUVmenY6BRdHEgnAKERRSVsudcMEUZbubcpoN
         CvsvHHEYeqM9HR8wJmZVDK00OM9TNk5zmxNho+hoIRB5rM3O5sUjk9mFNjx4He10Q/HQ
         rTZg==
X-Forwarded-Encrypted: i=1; AJvYcCUXdjmuyd0RNHoGKafIHD45Lwl2qaG/N3B72XKapqfpCI2t5Ik23RsImsH/JFXdS96LsCVK89wTu7CruvA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUwcYtKYZuwho8yUAmxSlUg1kiX6ioDUOiPh9XaiUpuYMRTgDX
	t6fKPOcLBMcEL+n5fwoPM8e8jK1ZA9B2niKkp9y18vVfvunwMEsJAIemAw==
X-Google-Smtp-Source: AGHT+IFH3anUzwoQuBivPedCcdK9bVhcO9jxOtgmBll+zPoumxoC0Dyc5nI8v3sk3S90U8vqI/XnAA==
X-Received: by 2002:a05:690c:2d88:b0:6e3:3508:e32e with SMTP id 00721157ae682-6e3644d414emr40450027b3.41.1728915972060;
        Mon, 14 Oct 2024 07:26:12 -0700 (PDT)
Received: from [192.168.1.145] (57-135-107-183.static4.bluestreamfiber.net. [57.135.107.183])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e332b6166fsm15637827b3.8.2024.10.14.07.26.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 07:26:11 -0700 (PDT)
Message-ID: <5c3db3be-370a-44ff-8474-0c3b4fe71e03@gmail.com>
Date: Mon, 14 Oct 2024 10:26:09 -0400
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] linux-kbuild: fix: missing variable operator
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 shuah@kernel.org, javier.carrasco.cruz@gmail.com
References: <20240913171205.22126-1-david.hunter.linux@gmail.com>
 <20240913171205.22126-3-david.hunter.linux@gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <20240913171205.22126-3-david.hunter.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

https://lore.kernel.org/all/20241014141345.5680-2-david.hunter.linux@gmail.com/

