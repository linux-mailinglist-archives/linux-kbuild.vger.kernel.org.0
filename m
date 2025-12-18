Return-Path: <linux-kbuild+bounces-10177-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8AFCCDD7D
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Dec 2025 23:40:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 712663005481
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Dec 2025 22:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55CB72D4811;
	Thu, 18 Dec 2025 22:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jAZ0tnxv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E4F264628
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Dec 2025 22:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766097599; cv=none; b=poRMQ1qm6a98EItbLMizrq32CSXPEuJbjekN2pXASIYSkMRoWefzRrPQNOWFzWRPx3ETTNXxvX5W9nTRyo410JId4hD+s/s6RWHV3Q8nuGz8jdB26aS9v3hQ8bt+TUT9gPgHWAyynJZeQhDuah9WtJcBJ+l9SmgLkKo4s/CNJYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766097599; c=relaxed/simple;
	bh=eamKHa6W7ULY0ixSx/sof431csrKXdlpYvmmnDnJOFA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XJA/+38w1ihivS9NvIn35mHLYAqk+03rLe346KF1cCjP2gCiemcNwbMiMvYvIXUTDaL/dlo5Lvjy1+R0JDnU64WqzJ1oM9Hw9UUZQmC94PG+HaHhbZG5bJrd2RiFGYrCAGL2jAvvCba8FPXQy7B6F0pHl0terxBkS8/TbcOzbPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jAZ0tnxv; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a09757004cso13263185ad.3
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Dec 2025 14:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766097597; x=1766702397; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eamKHa6W7ULY0ixSx/sof431csrKXdlpYvmmnDnJOFA=;
        b=jAZ0tnxv63j4DOvodBhWdTRwmrfNfUen/w5yFUlkAcD/EBvQzMK3Cm4wYcsRkZ7CBK
         4sz/2yI/lafXrnXEVoBkEsBKZKAE9HxUsBLGO7Qn2QZMZ02LPj48YWIYPoqZvSalkysA
         zuwJ2wPCbqN/tyd4fKR9glkI4s4H4ohAV5BdWZY50B1IIhTbj/xh/03LWPm9HZsLeeGF
         PuBgxvHQqjYuLwPZPHuI8ZNO3OcLQGLM/fzibopqhGZLHjzosQGGJx1r0PCxrh00P58Z
         NqSdkARs/ceSaP82PifVltK24F1o/zBO7P6zJ+hgiJeb1nbQoEkaAhzqlali3TVBWvQx
         0Ojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766097597; x=1766702397;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eamKHa6W7ULY0ixSx/sof431csrKXdlpYvmmnDnJOFA=;
        b=QJJSj/NFRneYznwVXfPmN+XA4xfPzhh/iMiX/BGiY8mDJ0tN6RMY+9iSEHDtSlPJ1I
         nvP056SrTb7W3WUU+FtXEz9EnyvEs5SpQ3Dns4LUHo3rnr3gQK9Rd1CvLLdxpuoCqeZL
         6oKieS7MB6MeaUJOu+pbHInN7B7+uEI6aou7E9POIO0iYnXUZNZOFrLsCxsM2RPD0N4D
         OeLNYQ/CXk5E/6MFTqu4U7fj0va9P3SzwuXb8R6pdq66tMS+1mAblrFUP8noc3YI9EOY
         XvCyr+qSs7GwbJWYbWpL3M6KmKNgLuCpzqdGKDVBkuyLLqWB5mOER/N1WVLL/SWnEVxL
         Q7jA==
X-Forwarded-Encrypted: i=1; AJvYcCX+/Dz/37fTAGe80YQ6Wru80jxspE9gUPlV5qrIwOeSIEDfFZhWHwAHiXkqOVgxqi6dCzpjpD2UE6WFavU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlAA5eWwxaDSymtQBt+3EKulbjggt2fBZQS5yrhxbV9W3X/vrM
	QADx6a58q53AmL2Vt77kMtyjMLrlPjfyNLFOHCQX0uqJ7PQwAbmQX5bcY8bX67Bbz74=
X-Gm-Gg: AY/fxX5Fcm90otUC49Lc2NioioPgesxK424dS6JmGX52Eqowdyi9VrbC0lhn6hhF0A1
	jOOJUNS3Y1zbQnL9xQPJ6/vSWNQ00qaLfuNaOePLn+AgP/fG0CL8kTn/BDJO8hAzZjZP1gLD9uF
	ethhN3D8egk4Mt88Iik65kJBKwm18Jwq3lauZWth1+o+A4dfZzPD3fuiBLMYjOrXdoD52nJFWjC
	RdeYzBkq9lG/PQU6k0VxoN7Qoz3+WZpg4gYHx3YUL1HxDkc0z4xvqVkB6CxlavWOYdjG4/vWuvR
	QgO1Kqa4rueou138DttUqHELFiaQQc2MXVeRWbLkIE+3NP7oV+4fQ5tDIDj8MWk4cmFnaOua52i
	0U7wUgMbAfWZG8csYXeZogs/KDTqc7Ep3BbdM6YwHuawcsXdWC6JiXs4K7RLeOMF5+Sex+lwstW
	+p/KaKComx/9qxf0GAnmtgevdU9OY2iBsSh+xk
X-Google-Smtp-Source: AGHT+IEVSlp9LXlzmaGmg8SZZsLd9mJhWKS6Iylg31EbQc75zWEKIMS5zueMBmRpuYcgZRvP0hKo6w==
X-Received: by 2002:a05:7022:2586:b0:119:e56c:18a7 with SMTP id a92af1059eb24-121722b4e90mr878908c88.15.1766097597216;
        Thu, 18 Dec 2025 14:39:57 -0800 (PST)
Received: from ?IPv6:2a03:83e0:115c:1:4779:aa2b:e8ff:52c4? ([2620:10d:c090:500::5:3eff])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253bfe2sm1480954c88.10.2025.12.18.14.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 14:39:56 -0800 (PST)
Message-ID: <62a74bb81d7e791cffe4aa52bf3e18bc854f3edc.camel@gmail.com>
Subject: Re: [PATCH bpf-next v4 8/8] resolve_btfids: Change in-place update
 with raw binary output
From: Eduard Zingerman <eddyz87@gmail.com>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>, Ihor Solodrai
	 <ihor.solodrai@linux.dev>
Cc: Alan Maguire <alan.maguire@oracle.com>, Alexei Starovoitov
 <ast@kernel.org>,  Andrea Righi <arighi@nvidia.com>, Andrew Morton
 <akpm@linux-foundation.org>, Andrii Nakryiko	 <andrii@kernel.org>, Bill
 Wendling <morbo@google.com>, Changwoo Min	 <changwoo@igalia.com>, Daniel
 Borkmann <daniel@iogearbox.net>, David Vernet	 <void@manifault.com>,
 Donglin Peng <dolinux.peng@gmail.com>, Hao Luo	 <haoluo@google.com>, Jiri
 Olsa <jolsa@kernel.org>, John Fastabend	 <john.fastabend@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Justin Stitt	 <justinstitt@google.com>,
 KP Singh <kpsingh@kernel.org>, Martin KaFai Lau	 <martin.lau@linux.dev>,
 Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers	
 <nick.desaulniers+lkml@gmail.com>, Nicolas Schier <nsc@kernel.org>, Shuah
 Khan	 <shuah@kernel.org>, Song Liu <song@kernel.org>, Stanislav Fomichev	
 <sdf@fomichev.me>, Tejun Heo <tj@kernel.org>, Yonghong Song	
 <yonghong.song@linux.dev>, bpf@vger.kernel.org, dwarves@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sched-ext@lists.linux.dev
Date: Thu, 18 Dec 2025 14:39:54 -0800
In-Reply-To: <CAEf4BzZA4czi1KEOrW9tn8v18LZN4FAqzrHyB_78VatEZhb+Fw@mail.gmail.com>
References: <20251218003314.260269-1-ihor.solodrai@linux.dev>
	 <20251218003314.260269-9-ihor.solodrai@linux.dev>
	 <914f4a97-f053-4979-b63a-9b7a7f72369a@linux.dev>
	 <CAEf4BzZA4czi1KEOrW9tn8v18LZN4FAqzrHyB_78VatEZhb+Fw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-12-18 at 13:15 -0800, Andrii Nakryiko wrote:

[...]

> It all looks good to me, so don't wait for any more feedback from my
> side. If Eduard doesn't find anything in patch #8, please send new
> revision, thanks!

Lgtm, let's wrap this up.

[...]

