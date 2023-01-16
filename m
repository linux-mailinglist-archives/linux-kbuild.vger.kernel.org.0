Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A983166B572
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Jan 2023 03:02:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231421AbjAPCCB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 15 Jan 2023 21:02:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231626AbjAPCCA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 15 Jan 2023 21:02:00 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DCC84C21
        for <linux-kbuild@vger.kernel.org>; Sun, 15 Jan 2023 18:01:59 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id n5so28078797ljc.9
        for <linux-kbuild@vger.kernel.org>; Sun, 15 Jan 2023 18:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+XTvhIQQk40fK8svIeiVlLX9voGZYJ/3JEv+qqSKWMg=;
        b=CkUd28DVeh36PRCWQTX6nwQK8ShkKKNUJ0DcKMe9pFibrXy4w/B6HOh/lnu/H1kfUo
         YwqZL08b0p/ualbaIsdSaUe2/xbzqgQkciKRtIFSjURcQoGB6zMbO5J35iHwSfPXWvsP
         feYjEKyNEDMQivMl5xA1RsU+JeWhtyLKFb7xMSFnGQFrqMbq5ayJM/e3DA3ARVK9M4V4
         I8cylZNpF03dbmjKiT1PIMEnzAGyW+iA05gqcdxuCSsZdv3cf413d5fhsNcEdqtXZc9H
         xOxT55Wv9SJ6TNQtrnPO+TIVEX5mzm6d39Gct0WDezcKMlGkMjsAy6GPVf9SO4sh7bH+
         nQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+XTvhIQQk40fK8svIeiVlLX9voGZYJ/3JEv+qqSKWMg=;
        b=EiyTAxu6+13dIybCOZwG5nc/quYKU6qlaYIm3wsIviIf8XLcOzZ6tvsuyLCdDnGvDb
         nX90xqeLYccuk/F2g5zmjRPzdV2Vm6u7USTf6VluXSLvSiQn1CVCCB64F2UpnLXdQUth
         lWoM5S9WUcSiFV0eUivVO6vS3p+i5f2iIqYmfQXXw9ETpXU195EqW2Be+P5ybOPxI24V
         Ny6kjyvOPMBkkll4QvXHjAiEpKXdQdc1qZPcrYFo7azS//KC1In56NXVXyTb7oTMLX6Q
         z84Fqd1+iwM1NsMhuENWUG/bK1Y2ij5b5HIaM8mEx+bVmU8FGccstnvfpg+NbrgYc7Wj
         ZOSw==
X-Gm-Message-State: AFqh2krtCVJHXhJVQxzO7uZeiwYRZXj4WdxFLdZzeoYXOS84SdiMk/uM
        Mr/4BXgLIaRhIhZy/E7kjy4UddTqyWKCI0OGfLU4c6HFR6pS1A==
X-Google-Smtp-Source: AMrXdXv12+4/Y95egbNK4Oeehr80LOmcfFQj05K1ZBG4V8zSS29Gh1O53X4sIKzAH4e/BGXDxbHaMsKGqzpaxf0B/B8=
X-Received: by 2002:a2e:9188:0:b0:289:81a4:3a7b with SMTP id
 f8-20020a2e9188000000b0028981a43a7bmr968655ljg.487.1673834517639; Sun, 15 Jan
 2023 18:01:57 -0800 (PST)
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Mon, 16 Jan 2023 03:01:20 +0100
Message-ID: <CA+icZUV+4QovjQnkAgvon6POgZWstVd-AhZ7OkPU9onuktif1w@mail.gmail.com>
Subject: [6.2-rc4] warning: cannot check the header due to sha1sum missing
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro,

I saw these warnings in my build-log:

  if ! command -v sha1sum >/dev/null; then echo "warning: cannot check
the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s://
::p' include/linux/atomic/
atomic-arch-fallback.h)" != "$(sed '$d'
include/linux/atomic/atomic-arch-fallback.h | sha1sum | sed 's/
.*//')" ]; then echo "error: include/linux/atomic/atomic-arch-f
allback.h has been modified." >&2; exit 1; fi; touch
.checked-atomic-arch-fallback.h
 if ! command -v sha1sum >/dev/null; then echo "warning: cannot check
the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s://
::p' include/linux/atomic/
atomic-instrumented.h)" != "$(sed '$d'
include/linux/atomic/atomic-instrumented.h | sha1sum | sed 's/ .*//')"
]; then echo "error: include/linux/atomic/atomic-instrume
nted.h has been modified." >&2; exit 1; fi; touch .checked-atomic-instrumented.h
 if ! command -v sha1sum >/dev/null; then echo "warning: cannot check
the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s://
::p' include/linux/atomic/
atomic-long.h)" != "$(sed '$d' include/linux/atomic/atomic-long.h |
sha1sum | sed 's/ .*//')" ]; then echo "error:
include/linux/atomic/atomic-long.h has been modified
." >&2; exit 1; fi; touch .checked-atomic-long.h

NOTE: I did a `make distclean` before I started my build.

Can you please comment on this?

Thanks.

Best regards,
-Sedat-
