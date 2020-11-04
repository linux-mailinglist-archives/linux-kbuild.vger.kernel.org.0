Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9B02A5AD4
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Nov 2020 01:00:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728431AbgKDAAU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Nov 2020 19:00:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726709AbgKDAAU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Nov 2020 19:00:20 -0500
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 234ECC0613D1;
        Tue,  3 Nov 2020 16:00:20 -0800 (PST)
Received: by mail-qv1-xf30.google.com with SMTP id e5so5301488qvr.2;
        Tue, 03 Nov 2020 16:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sBlEcrQKMaPe+KohbddbaWe4TK9yPL+Wt7MWMnxm1hI=;
        b=NCaSGxD27+WLCPQ8aOu6r4PFOO2xHUp7wreCeTIAP09iyqv3Kqb2mmRhyHTW9dwlZx
         8DQQj4/4aEA2VTYY2hwSxw+em/hdm/eSZGupAeMSZrYaHt58q+hqBxu5bQPL8KXb6fhm
         m00AuQ1fthBiebdOM4ZKPUKafSR5aDGAh8oASQygXzMvBvyALSxv/fxPN33WaWNkNFIb
         WsSCIGYbSc4fSTx/cKPO2wS6lWeiVKJ5/O0a1LytypLUpQHvQohdzSTu5yGq0rf78kZz
         Tfrd7yr4QPzYaUEJXtcyk8mR7dZLYW16oKGYtcbbzjBmutPAAvAgRwhwiYOh3Cuu03my
         ai8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=sBlEcrQKMaPe+KohbddbaWe4TK9yPL+Wt7MWMnxm1hI=;
        b=BLVBA/LKrUH/ftWf2GSnpvBYlMTl5afsP3cY6XrbvfWtdvzekn9f6PpwwzE6LTUiUG
         imQMzrOntJgGnrOEa73HZ4oYTLU/d+uuz3yIu2MSymPj1wPGPSTvS0q/hepXk872xBkv
         QrILrpIce/oPQMvWIOFTBpR66LCkFuU1IPvYRI6/aCQjRYIZUd95jpasplM226vGLzaT
         GMswkjWZPyxlN31hgQy7ht3WvJ1/VpEdo80J0PhA/guq64SqhjTn1ek/IgTFagnu2nT9
         G438m6fQZAlRZc8lsrcWmO+f7MGivvIS+cAaELLZnmEdMmjGiKFSFloGUCTRSeOfB/v3
         QZrA==
X-Gm-Message-State: AOAM533fsdSHoNdj05SYsUC7aAoP6aiXor5ByAXPnh748rvXyO5gVkVm
        JuNFQvE2UCPXUJwKimBWlavht4H1Lxdxww==
X-Google-Smtp-Source: ABdhPJxRtdccN7P/DQ2aft9NGU7eOKa1g3H4JMubiqLsf2VeppboaQTlwLTSVvaZccDUCv/W3ONIBQ==
X-Received: by 2002:a05:6214:9d2:: with SMTP id dp18mr1033766qvb.29.1604448019071;
        Tue, 03 Nov 2020 16:00:19 -0800 (PST)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id k17sm516851qki.5.2020.11.03.16.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 16:00:18 -0800 (PST)
Sender: Arvind Sankar <niveditas98@gmail.com>
From:   Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date:   Tue, 3 Nov 2020 19:00:16 -0500
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        linux-toolchains@vger.kernel.org
Subject: Re: [PATCH] Kbuild: implement support for DWARF5
Message-ID: <20201104000016.GA2399651@rani.riverdale.lan>
References: <20201022012106.1875129-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201022012106.1875129-1-ndesaulniers@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Oct 21, 2020 at 06:21:06PM -0700, Nick Desaulniers wrote:
> DWARF5 is the latest standard of the DWARF debug info format.
> 
> Feature detection of DWARF5 is onerous, especially given that we've
> removed $(AS), so we must query $(CC) for DWARF5 assembler directive
> support. Further -gdwarf-X where X is an unsupported value doesn't
> produce an error in $(CC). GNU `as` only recently gained support for
> specifying -gdwarf-5.

Do you have more details here? On godbolt.org, gcc does report an error
for unsupported dwarf versions.

https://godbolt.org/z/G35798

gcc does not seem to pass the -gdwarf-* options to the assembler when
compiling C source. For assembler, gcc will pass an appropriate option
depending on the version of binutils it was configured with: if the
assembler doesn't support dwarf-5 it can call it with --gdwarf2 for eg.

If the user is using a properly configured toolchain it doesn't look
like it should be an issue to just use cc-option?
