Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8827E5E2A
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Nov 2023 20:08:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbjKHTIH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Nov 2023 14:08:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbjKHTIH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Nov 2023 14:08:07 -0500
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E24A1FEA
        for <linux-kbuild@vger.kernel.org>; Wed,  8 Nov 2023 11:08:05 -0800 (PST)
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-35941ccaa85so288495ab.1
        for <linux-kbuild@vger.kernel.org>; Wed, 08 Nov 2023 11:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699470484; x=1700075284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+y/pMXrH+RER4Ji1NW1gVJF+JSzMmU6WR1FGY6uB+M=;
        b=IdzokQggTmeGk/J9+uUGM+g4AOOTgy96qzdvFKNifaFhfeYbkTRpo8OhqNlNLgYUMj
         bJCYZhqZd0tmzoJqVOLleJnL6CZGGzBb3AwpuVcdUr7Ku3pFfWvHq6yXsjWi4/ptZHWx
         WlZugBbCR3HwZhYeykWmbjqPPTlAE8N9f6JZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699470484; x=1700075284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7+y/pMXrH+RER4Ji1NW1gVJF+JSzMmU6WR1FGY6uB+M=;
        b=sWc3fJl6839MkHBOt3PA5aEh5z+EbvtsGAgBlVJQ/tuDip0i4qBDosbe1f35VxiYFJ
         uwlrvKbVr2xhLWEUDEJoaTfxZQOplVDjWnWr0wQ/SJkY2nnzkJk9xlDp+UUXESA0ooQH
         Nmx2LNpYZbgwPls9jYW7HYAxya3qOmA+StEQ/jWiIG6aHkUBukRcXir1VoARZEi0GkLu
         y3STifCJGlKuk66JtZCYsVHG30bv+AbUSB+6riafWqMBhBkj6kqKRSGvu1unu3h28r4b
         UT65XXnka7y3MX17UyNBn3QrXOX+Fl2x5C6KBWzr936IjE6/ZQIg7It82ME7TjVv6WEG
         CV+w==
X-Gm-Message-State: AOJu0Yw3y6wUsWc2JXoP0yAGKvkw4Zb5B0Xy2AalxdCm6l455t39pn9u
        fS5xWHYhETd+WYGuFUN//ybNpjOJWUeJt6L891v7bA==
X-Google-Smtp-Source: AGHT+IFbqFe5r0jnsXu7HNVSBo/ve67U7d3pFqBiATc3k+0v0vWrEKmQjtXdU+7xVQqDsPAPkYHyKA==
X-Received: by 2002:a05:6e02:1baf:b0:359:42cd:1417 with SMTP id n15-20020a056e021baf00b0035942cd1417mr3350505ili.17.1699470484585;
        Wed, 08 Nov 2023 11:08:04 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id x25-20020aa784d9000000b006babcf86b84sm9304531pfn.34.2023.11.08.11.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 11:08:04 -0800 (PST)
From:   Kees Cook <keescook@chromium.org>
To:     Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: (subset) [PATCH 06/22] [RESEND] stackleak: add declarations for global functions
Date:   Wed,  8 Nov 2023 11:07:31 -0800
Message-Id: <169947044722.632596.1406506664231353344.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231108125843.3806765-7-arnd@kernel.org>
References: <20231108125843.3806765-1-arnd@kernel.org> <20231108125843.3806765-7-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 08 Nov 2023 13:58:27 +0100, Arnd Bergmann wrote:
> With -Wmissing-prototypes enabled, the stackleak code produces a couple of
> warnings that have no declarations because they are only called from assembler:
> 
> stackleak.c:127:25: error: no previous prototype for 'stackleak_erase' [-Werror=missing-prototypes]
> stackleak.c:139:25: error: no previous prototype for 'stackleak_erase_on_task_stack' [-Werror=missing-prototypes]
> stackleak.c:151:25: error: no previous prototype for 'stackleak_erase_off_task_stack' [-Werror=missing-prototypes]
> stackleak.c:159:49: error: no previous prototype for 'stackleak_track_stack' [-Werror=missing-prototypes]
> 
> [...]

Applied to for-next/hardening, thanks!

[06/22] stackleak: add declarations for global functions
        https://git.kernel.org/kees/c/65120498aaf8

Take care,

-- 
Kees Cook

