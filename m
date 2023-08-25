Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96E18788E85
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Aug 2023 20:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbjHYSVh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 25 Aug 2023 14:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231258AbjHYSVQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 25 Aug 2023 14:21:16 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6546E269E
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Aug 2023 11:21:12 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1c06f6f98c0so10439385ad.3
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Aug 2023 11:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692987672; x=1693592472;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cd1paIDws1ExLMgJh/WiTiPNEsGUGwcEQ17xiLulNdo=;
        b=nhk5Ko+OG/2Q2+PvkEDtXdRrk3or+134Updyqdlu1P6XQCscy7egtl8AziCQjtc+Bn
         zp65RvpL7MR7vfIQJtiyZ3WEwZ2/AOZJxGZQ4mDRGInpxpoBv+UhEk0r9hCNWL5bYNqC
         5O0xNrQMLaQBipxQ7a78YEG4PHOgm1S3/j8H4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692987672; x=1693592472;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cd1paIDws1ExLMgJh/WiTiPNEsGUGwcEQ17xiLulNdo=;
        b=Y9oz+hqw7M++C76eJ/r5/Zc155RUg9CnrZawh/e6Fam3UaZFkycyOA/vpUI4IbC3iK
         +CBVgpRPZ69e3VyCguNlKdPWz9AcV/8DXUdTzAgeoQv1VooPG5X2cINLZlOBfHKxJAtf
         jYfoJd3I/XsavxDPIrVDWy3v0jxvZ0rQsmZMUJDpkxQMJDM+HIFTGOb+4tj5hNbSZxLm
         RwwWqwl3EAU+u91ctyZRGhxJwXwiLIDWK3QNCeK+Epv+6yDYfqo96pC/RtcllyJtQGPy
         5aC2djPn/3TUKkHDdJg+7zNaZGS/cKP95RexZJXtMvGvQPvxV9cQqpEsrtKzvTejD2So
         +Sow==
X-Gm-Message-State: AOJu0YyoxsVGVgqZ0KLt/WP8PYfdJBBtzDuT5i5RziZLrqQnnWLq7uME
        c1EPSQDJGmZZcgdjeEdmxsLzwQ==
X-Google-Smtp-Source: AGHT+IHIDQ9FIJyjliN/xDw65w9ny7WQFMwwk363Mwv+Ejm+xJkfXuvIT+Ox7t86mTNHW1gFw7K36Q==
X-Received: by 2002:a17:902:ec87:b0:1bb:9f07:5e0 with SMTP id x7-20020a170902ec8700b001bb9f0705e0mr21488860plg.60.1692987671857;
        Fri, 25 Aug 2023 11:21:11 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902c10600b001bbb598b8bbsm2056354pli.41.2023.08.25.11.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 11:21:11 -0700 (PDT)
Date:   Fri, 25 Aug 2023 11:21:10 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] kbuild: Show Kconfig fragments in "help"
Message-ID: <202308251120.159800A@keescook>
References: <20230824223606.never.762-kees@kernel.org>
 <42174d5e-59f0-4612-d7a1-11e830d0a044@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42174d5e-59f0-4612-d7a1-11e830d0a044@csgroup.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Aug 25, 2023 at 04:56:54AM +0000, Christophe Leroy wrote:
> Le 25/08/2023 à 00:36, Kees Cook a écrit :
> > +# Base hardware support for 86xx
> 
> s/86xx/85xx
> [...]

Thanks for the typo fixes! I'll get these all fixed up. :)

-- 
Kees Cook
