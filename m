Return-Path: <linux-kbuild+bounces-175-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B37B27FAF16
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Nov 2023 01:34:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CF532817B0
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Nov 2023 00:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69C01859;
	Tue, 28 Nov 2023 00:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Zj/s9vWM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85F321A7
	for <linux-kbuild@vger.kernel.org>; Mon, 27 Nov 2023 16:34:18 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6cb9dd2ab56so4224098b3a.3
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Nov 2023 16:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701131658; x=1701736458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYiTIXqRTDarNbi0aa1f81qxroNRuY69MIWNnPKjAyY=;
        b=Zj/s9vWMze0CQMyIflVTK3B3dxSeRg1P9NPpAdamgEcVQzPB+/KC5Bg0UH6DBrYjz+
         Cw9uwhTWfRln18EmUt4Rro0DET7kc4CoKcieM+nxU5Ge9irWUlRC8c10o2ffkuyspse5
         6qMsjsR0wydgD20oX3OOAvpvvrDhBusbtvndQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701131658; x=1701736458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xYiTIXqRTDarNbi0aa1f81qxroNRuY69MIWNnPKjAyY=;
        b=tbAViBLc4eefYFsPYNplIwRwGefVmc/B5/bJtpzIDZFx8iCDA0cfXtQneQZBuiF9iU
         VBeiqn9Ezue3B8/qan7llM2noi7y760pnC6WtaYVe0pju5SrRmE7rvvrvaaPOGMN1qo2
         aF4FASS4KkoP7LhzBZvh7hGQvhQmtU5ADvrGXFOUcnJH4nSs01iV42E4yCb1sTEMACte
         QLzbMKYjU1ZFPuc+qxfiibXNxGdhmD6UF/8GfqYg5FYlyxPPukY+8qZl9I0ncjz6tpIN
         x0371dHuysIZaUDJhmRGRzAOdPwrfymGCu23yNyZ5E/lekRxC+9SuNzgBgnEJlhAYCSB
         NdQQ==
X-Gm-Message-State: AOJu0Yz+J8k2OIo3AZnwyWnRivVnK301bT++eBGe2oaujDo9LJqP+bkZ
	myabRINIxWOKdt5ocwMCqKwCEg==
X-Google-Smtp-Source: AGHT+IE1qopXbd9oTJotAIwAhuzGIfmugcli9ua2BkHYosf3Vb/rPrjdoH2dQ3EIE9Fwv7Aw8jhVSA==
X-Received: by 2002:a05:6a20:144b:b0:18c:382e:48fe with SMTP id a11-20020a056a20144b00b0018c382e48femr11176362pzi.15.1701131658027;
        Mon, 27 Nov 2023 16:34:18 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 102-20020a17090a09ef00b002800e0b4852sm9214040pjo.22.2023.11.27.16.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 16:34:17 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: ndesaulniers@google.com
Cc: Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Tom Rix <trix@redhat.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: refresh LLVM support
Date: Mon, 27 Nov 2023 16:34:11 -0800
Message-Id: <170113164796.1670732.18133777682518787773.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231117-maintainers-v1-1-85f2a7422ed9@google.com>
References: <20231117-maintainers-v1-1-85f2a7422ed9@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 17 Nov 2023 11:24:02 -0800, ndesaulniers@google.com wrote:
> As discussed at the ClangBuiltLinux '23 meetup (co-located with Linux Plumbers
> Conf '23), I'll be taking a step back from kernel work to focus on my growing
> family and helping Google figure out its libc story. So I think it's time to
> formally hand over the reigns to my co-maintainer Nathan.
> 
> As such, remove myself from reviewer for:
> - CLANG CONTROL FLOW INTEGRITY SUPPORT
> - COMPILER ATTRIBUTES
> - KERNEL BUILD
> 
> [...]

Applied to for-linus/hardening, thanks!

[1/1] MAINTAINERS: refresh LLVM support
      https://git.kernel.org/kees/c/9099184dec26

Take care,

-- 
Kees Cook


