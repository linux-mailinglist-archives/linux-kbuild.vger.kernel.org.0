Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF7C07BB460
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Oct 2023 11:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231506AbjJFJj4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 6 Oct 2023 05:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231361AbjJFJjx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Oct 2023 05:39:53 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B5B5EA
        for <linux-kbuild@vger.kernel.org>; Fri,  6 Oct 2023 02:39:50 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-c647150c254so1715462276.1
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Oct 2023 02:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696585189; x=1697189989; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PEXT3zqowOcMEROZsvFX4v+s9GuyI4jw/O9QWyH3wnk=;
        b=E/cNEK988vE/2UzGrIVHfvV+XvzcGegtB9eTufoZSSCRUEjM1/UEVPaqobQcusXK1W
         mgm7lwdJf+edbOwN4L/1Mit6IvPx8XbSMXns7vk05YRGr+70d4KGM/CRju87hr6Z9M6Z
         lqB9ZKUMSE0foulUmWdhiw9bPi3Pznmn1m6+J93DLZjlczqkULdN/01p4MHulvgJqPdd
         WW6YA3T2pdSIk8kQEsUKyOxEKaXq7/A4/dMCUesO+YHLr4hAgT05MuwlQOqXCnCL9b40
         xoLQDep5BsziMh/u1r+PdHF4U/+T/kGEehQcfWovwajBAgxKZdm5exy7rHcuY09bKIRn
         9zzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696585189; x=1697189989;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PEXT3zqowOcMEROZsvFX4v+s9GuyI4jw/O9QWyH3wnk=;
        b=ZQy2PoBQImCiALhtNDFL4M2E4nBBLHEVREXLt/XUb/+YOUL+bqnmUcaugVWwsPpWQ/
         /gCB0K9YiUkpHnQbZVcJh08AdpBMz8swcyMK7/ktrUE7Fgejmu5i2a5oXXFYuVX1VtxD
         M5F2epfDxNpAxeSScYZY/zQhKawbU5/zHW7dfAppnkT9xZp32Js1p1BsXUagbVb0CIzk
         WCV5JoZ0gb3JR8oei56wu78Xwvo1HLWTTV7pKNM7HBdhNch4X+oh+YVC0tMc/4sSFQNl
         zqe4/0lcoX3emItkK7qLUDsVYerhIst4L22DtfG9S0Tc7jK/m/cWzKfjt2o7YynjFEw7
         xqew==
X-Gm-Message-State: AOJu0YzSMmEBq/Sg7ps1gfWfLqelfhYye27GyoQVStItfOZ7ZXevle03
        lb7FOX1wFDpVe9djBZUnPPoSku1lNhOjv30=
X-Google-Smtp-Source: AGHT+IFQZBWfdCaXSSBlDUFgpHkcIgBKA74bFHPu54DP8HGTzVNML46hu40WvzPmiCHJHHBqFZplWFGw1pok0Uo=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a25:1682:0:b0:ca3:3341:6315 with SMTP id
 124-20020a251682000000b00ca333416315mr107661ybw.0.1696585189364; Fri, 06 Oct
 2023 02:39:49 -0700 (PDT)
Date:   Fri,  6 Oct 2023 09:39:41 +0000
In-Reply-To: <20231005214057.759089-1-mmaurer@google.com>
Mime-Version: 1.0
References: <20231005214057.759089-1-mmaurer@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Message-ID: <20231006093941.1151819-1-aliceryhl@google.com>
Subject: [PATCH v4] rust: Respect HOSTCC when linking for host
From:   Alice Ryhl <aliceryhl@google.com>
To:     mmaurer@google.com
Cc:     a.hindborg@samsung.com, alex.gaynor@gmail.com,
        aliceryhl@google.com, benno.lossin@proton.me,
        bjorn3_gh@protonmail.com, boqun.feng@gmail.com, gary@garyguo.net,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, masahiroy@kernel.org, nathan@kernel.org,
        ndesaulniers@google.com, nicolas@fjasle.eu, ojeda@kernel.org,
        rust-for-linux@vger.kernel.org, trix@redhat.com, wedsonaf@gmail.com
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Matthew Maurer <mmaurer@google.com> writes:
> Currently, rustc defaults to invoking `cc`, even if `HOSTCC` is defined,
> resulting in build failures in hermetic environments where `cc` does not
> exist. This includes both hostprogs and proc-macros.
> 
> Since we are setting the linker to `HOSTCC`, we set the linker flavor to
> `gcc` explicitly. The linker-flavor selects both which linker to search
> for if the linker is unset, and which kind of linker flags to pass.
> Without this flag, `rustc` would attempt to determine which flags to
> pass based on the name of the binary passed as `HOSTCC`. `gcc` is the
> name of the linker-flavor used by `rustc` for all C compilers, including
> both `gcc` and `clang`.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Tested-by: Alice Ryhl <aliceryhl@google.com>

