Return-Path: <linux-kbuild+bounces-176-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF02A7FB14D
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Nov 2023 06:34:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8AB3281D1E
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Nov 2023 05:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B5C88831;
	Tue, 28 Nov 2023 05:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Hndy02yt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84D6D1B8
	for <linux-kbuild@vger.kernel.org>; Mon, 27 Nov 2023 21:34:49 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1ce28faa92dso38864515ad.2
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Nov 2023 21:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701149689; x=1701754489; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rLD4U1IQ3GBXZUYRBdNM3XjIajDHuVM3KMdSWM11Qn4=;
        b=Hndy02yttaR7uPciKF4mqyxHp/ZzphH50Pn8hswI1nmCCmMRiACwdOOxOCtKxpzAEm
         rvFD7mswAZUI9zITOhIQyqdG2ChpV+lnvWbnkm1jLevUdOntKSO8G629xXhHayTJ1jfK
         3Uei5bjNJ4tTfNr6zirGydojqZaAb7dnWkjpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701149689; x=1701754489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLD4U1IQ3GBXZUYRBdNM3XjIajDHuVM3KMdSWM11Qn4=;
        b=Gyy8ijIIKAJdNeHbkLiKHq4KduwTqIXwr4zxsj9AUEHncsXQBPc0Gqwpj53qD8WQMc
         9nplTmosu7EZyx0xoYibXL/VCBF8PozFJGe92rqbRAYtqsWCNHsAiEStT0DcDduRx8e9
         uLaMt3ouEbiyqtOe4qyP/0U4c0CTCA4dYB/zu0WomOTeXycnFJwx+2zwsQYZN7c6/DwJ
         0DyiLhP0ThWBgmwfeqFCZ5wjaM+2iJe4xM639NaW2OWYI0yR+tMCl2bXb1WHsmVl3KNM
         fhZjo5W4lShrkUbQF49Z1F4QCfQjpwsuQCmMLCXsSRnEpvmSzL6kd7AJ8zDe5WZPEsuk
         XS9A==
X-Gm-Message-State: AOJu0YwsL31JXBOTcxYgaCWD6tpyEez4Pe/i7t5eudSuk2i8GfsBYPdN
	Qn0ttXNOlhw3vvUM3bnL7bTLzg==
X-Google-Smtp-Source: AGHT+IG9oo9og7X0ZOa7sH8woREQOsxuAEQf7/f2lcKOZ5d71WwjwmAbp9twRvlp1eqdZVSNGAhVTQ==
X-Received: by 2002:a17:902:9a96:b0:1cf:b4ca:4e79 with SMTP id w22-20020a1709029a9600b001cfb4ca4e79mr6869880plp.17.1701149688975;
        Mon, 27 Nov 2023 21:34:48 -0800 (PST)
Received: from google.com (KD124209171220.ppp-bb.dion.ne.jp. [124.209.171.220])
        by smtp.gmail.com with ESMTPSA id l13-20020a170902d34d00b001cc29b5a2aesm9280184plk.254.2023.11.27.21.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 21:34:48 -0800 (PST)
Date: Tue, 28 Nov 2023 14:34:43 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Patrick Georgi <pgeorgi@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Stefan Reinauer <reinauer@google.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] kconfig: WERROR unmet symbol dependency
Message-ID: <20231128053443.GA6525@google.com>
References: <20231122034753.1446513-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122034753.1446513-1-senozhatsky@chromium.org>

On (23/11/22 12:47), Sergey Senozhatsky wrote:
> When KCONFIG_WERROR env variable is set treat unmet direct
> symbol dependency as a terminal condition (error).
> 
> Suggested-by: Stefan Reinauer <reinauer@google.com>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>

Gentle ping.

