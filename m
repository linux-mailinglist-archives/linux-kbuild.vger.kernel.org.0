Return-Path: <linux-kbuild+bounces-4386-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9EC9B5811
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 00:58:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17E251F23A97
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Oct 2024 23:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3DD820C47D;
	Tue, 29 Oct 2024 23:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0tDBdDkM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8F920C019
	for <linux-kbuild@vger.kernel.org>; Tue, 29 Oct 2024 23:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730246007; cv=none; b=RG6khIv2i7D4CiyMN51Rdo/+Wh0zEh/KTDcfLdIrnEE1A17fCP9M4nHPH2e4NBD4HuwSS5l/QwKkrc4T9NLEHzKn8cZZAPOWbG2faqOfgWbUzqoqKF+zk4XZuyuzpQlEp+3jisXb3G9CjjdGH915alQmB10ts/gvvBQBwptLM64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730246007; c=relaxed/simple;
	bh=BiCabWdS2vxLBuw9FlQyB8b+KJNojmOugixJl887czU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H/E/6XhoEgkPsYth5w7AIysXn2aesA6ncsyNGU6RP0BvLLJN15S3DQWp3GKLXSqs3j+Ex+FCXtw/2vXiucr6231aoAJ0Mv6F8wQVp4Ib9sjhBkPnEURtESfBaXU5/jaaRVJjxzZ+rDrWuTcSsl1P53GnhU7l2rTvWKzrdVU05y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0tDBdDkM; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539e66ba398so6136e87.0
        for <linux-kbuild@vger.kernel.org>; Tue, 29 Oct 2024 16:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730246004; x=1730850804; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BiCabWdS2vxLBuw9FlQyB8b+KJNojmOugixJl887czU=;
        b=0tDBdDkMnL9EyJr2hKFliDpYWZJxcm369Z+BSmaCCloF0Gv2d7ObHM/tKc2uLSPufR
         H1jvY849eR/Rr2+3+Uqyu2LXBxTljEUX4UeXUy4rn1/9fyET1I/XnP1fi7F9TKfc6/my
         0Oaxk/mW88T6GFvzHPRsCQZsN1dTjbhkA1Dh2f1eHyclo9SBTSqA/TOybLlcrRV3QulR
         wtHv0wATObHlh9aqVL7E7OQhBLtni05tuKLo8AkJwfcMM2l/4peLvo0NxT8SUSMvDrW1
         5t9DSAQCALZIs1lkEI4C/Flj4gt2e9auL/bH25VF2nJgXsn+78TAx4YBDAlFY49F+O4H
         MBzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730246004; x=1730850804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BiCabWdS2vxLBuw9FlQyB8b+KJNojmOugixJl887czU=;
        b=LFgZrXuCxix9b1rFimaHuJt8rJN2arMnDQZS3ftWq3UEkO0jLqh4kMy9byPnJBFwJr
         7qA5yqzmHJYbRAZni9qF4vCHtJlwGY6NF+H0D76o0+1TKm2r7dop8YtcBPP4nVPNtESN
         YyWZj6MSaj3P57QILmyGwwgL7q2tzJqI9tsLSlNh0tuW8G9TOjZ6/FOj3JXPa6Ulnb+k
         CJSq3F/3KFUhAK5BH5QxiPXbBNyxmKrmOJ7ua0G+x9KTGCduLLYHMKYvv9QMkP9x6bwX
         JedSkz1XQFE0Z4E1JcNGYObTfZmA8EHj17D99fzMHc9XAz1keVuMO8HJ2quPrRZFPSeX
         OQ1w==
X-Forwarded-Encrypted: i=1; AJvYcCXwfgulOuZZsVKt8bhZFzlueG9PFtZlse5CtV12uwioLNxclir1w0qood3kJXuNEXVO5ZLjPGc0pZe7QAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDFJoZYYfWsRBfyBx3F90ImoBL/5lTMrl5xdpVNwYoT9Kg408a
	Uzvtgin7hn2PPkUyxsFlyPKa3freip9nnb9J4WY8yoN2woRk0C3MeCyGZv0Bv4zfcOHtaDqZCSa
	th91v7Hl59hUozcr5W9DE/ibm3ArCclU/1YvJ
X-Gm-Gg: ASbGncvy11kVm2n9hpFIBIgLxVtIbIBwuqfOMvSsDaGacfc1ueX4o6R1eO9Dd281is1
	LSfHBZ6xGubZ75XwEAYMd0mNPYKYe
X-Google-Smtp-Source: AGHT+IHIQGDElLz8/qVf/OV7Pyn52bxrEmCudJB6RD46Ot+/aEOB2whwuA3TpN813KwxwWMUhrWTyKpmffCC9X64vLM=
X-Received: by 2002:a05:6512:1101:b0:533:49ab:780e with SMTP id
 2adb3069b0e04-53b4804d6b6mr875842e87.2.1730246003424; Tue, 29 Oct 2024
 16:53:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241029-remove-export-report-pl-v1-1-9cd6ccf93493@google.com>
In-Reply-To: <20241029-remove-export-report-pl-v1-1-9cd6ccf93493@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 29 Oct 2024 16:52:45 -0700
Message-ID: <CABCJKudHknUxbgHBX9kXOkyMEKn5VrFsLZ6u95fnqpngp4Wy_w@mail.gmail.com>
Subject: Re: [PATCH] scripts: Remove export_report.pl
To: Matthew Maurer <mmaurer@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Oct 29, 2024 at 2:12=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> This script has been broken for 5 years with no user complaints.
>
> It first had its .mod.c parser broken in commit a3d0cb04f7df ("modpost:
> use __section in the output to *.mod.c"). Later, it had its object file
> enumeration broken in commit f65a486821cf ("kbuild: change module.order
> to list *.o instead of *.ko"). Both of these changes sat for years with
> no reports.
>
> Rather than reviving this script as we make further changes to `.mod.c`,
> this patch gets rid of it because it is clearly unused.
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Thanks for the patch! Applying this separately without waiting for the
rest of the extended modversions series to land makes sense to me.

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami

