Return-Path: <linux-kbuild+bounces-278-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7778807962
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Dec 2023 21:31:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 420A01F213D4
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Dec 2023 20:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20216363;
	Wed,  6 Dec 2023 20:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nJG+0sgA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0B2612F
	for <linux-kbuild@vger.kernel.org>; Wed,  6 Dec 2023 12:31:07 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1d0bcc0c313so1308955ad.3
        for <linux-kbuild@vger.kernel.org>; Wed, 06 Dec 2023 12:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701894667; x=1702499467; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R3qk0JEUVnfBQ7ISC6DHPH710X5ye95VfntDF5kK12g=;
        b=nJG+0sgAYq880C+BDSNsCuY2GYiI//lDzFjiUQmcLW8VzhLgmVA9X+iNGwkfCy/BMm
         TH1r5Svbgt8U0ANi0cMY1xNev258TEWTIyMJ+Jv5DwgjzEeJnE1xSagpmDLs4cNMqlov
         /wiFS43E/5C4hgQZCgjw5PeEHz9dbQ7vIAUsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701894667; x=1702499467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3qk0JEUVnfBQ7ISC6DHPH710X5ye95VfntDF5kK12g=;
        b=Cbki7MYAJnKvWpQMNGDucSBRR9NN1ma3drp3L9+6LxYDHuWeQhDJBY2nwW/7l2UZIY
         tTK1UbvG6dqobV/PXIeg6oitfpkmS5hoXRGnHbqA4eZ/gHBatwWy0+mxL3oIgRcu9Kyd
         +7bwfbCTXxC5kDOU6m0yiX4bwDuovj/lXk7X9ohMQy9zH9wIaEw7frzb9GXdqZPXgeoc
         LWgQRWmSLz1gIheTOvgC2GW0WLcxfCHAxc4naaYTQs+KAtY9LJwERHDhxoQ+TU7hJxak
         CScPM7QfiL+wwvIt2chnWD1C7P/wPbObLVkrPRynAv4zkmGJnaq0bgu6Cz0ogC/pu823
         aJQg==
X-Gm-Message-State: AOJu0YyQpVaS8v8JfZXSH7abEBIFFbENvGV37ZtdYcXSikZfvkNCW2r8
	sbcszfQ8GQMLUmjise4M1HTk4w==
X-Google-Smtp-Source: AGHT+IFTSARJXzULUfBtkG58umPSC1L0MV7PhM+1kRcHUo2wOxQLgHWPIaFOXfo8S2iijJw0Qlgv+g==
X-Received: by 2002:a17:902:b705:b0:1d0:6ffd:8348 with SMTP id d5-20020a170902b70500b001d06ffd8348mr891494pls.83.1701894667119;
        Wed, 06 Dec 2023 12:31:07 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id bf12-20020a170902b90c00b001bf8779e051sm215112plb.289.2023.12.06.12.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 12:31:06 -0800 (PST)
Date: Wed, 6 Dec 2023 12:31:05 -0800
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, morbo@google.com,
	justinstitt@google.com, samitolvanen@google.com, nicolas@fjasle.eu,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
	patches@lists.linux.dev
Subject: Re: [PATCH v2 2/2] kbuild: Enable
 -Wincompatible-function-pointer-types-strict in W=1
Message-ID: <202312061230.DCDD958@keescook>
References: <20231206-enable-wincompatible-function-pointer-types-strict-w-1-v2-0-91311b4c37b0@kernel.org>
 <20231206-enable-wincompatible-function-pointer-types-strict-w-1-v2-2-91311b4c37b0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206-enable-wincompatible-function-pointer-types-strict-w-1-v2-2-91311b4c37b0@kernel.org>

On Wed, Dec 06, 2023 at 09:49:47AM -0700, Nathan Chancellor wrote:
> -Wincompatible-function-pointer-types-strict aims to catch clang kernel
> Control Flow Integrity (kCFI) violations at build time (rather than run
> time) by validating function pointer assignments against the expected
> prototype, similar to the existing -Wincompatible-function-pointer-types
> that is considered a hard error in the kernel. The -strict variant
> requires the types to match exactly, as opposed to just matching in
> terms of ABI compatibility. This is primarily visible with int/unsigned
> int in lieu of enum types or vice versa.
> 
> The tree is not completely clean, so this warning cannot currently be
> enabled unconditionally. However, there are only warnings in one
> subsystem ('drivers/counter'), so it is really close. In order to
> benefit from CI infrastructure that tests with W=1, enable this warning
> at that level, so that new instances have a chance of being caught and
> fixed during development.
> 
> This should eventually be a hard error in a similar manner as
> Wincompatible-function-pointer-types but some subsystems test
> with W=1 + CONFIG_WERROR=n, so it would be rude to break their builds
> when they do not care about warnings outside of their subsystem.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1750
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Keeping these from leaking in is always good. Thanks!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

