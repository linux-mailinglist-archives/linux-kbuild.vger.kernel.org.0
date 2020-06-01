Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 304921EB167
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2020 23:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728810AbgFAV7F (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 17:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728488AbgFAV7E (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 17:59:04 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E2BEC061A0E;
        Mon,  1 Jun 2020 14:59:04 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id y18so8648496iow.3;
        Mon, 01 Jun 2020 14:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=lbxm4I5yIjwGE7v8E0Zy1ljgjBqzdD4WSXAeDUOfDHo=;
        b=qD5A+XbNnysoSViBs22CCKHHgg2NkK3yfWAnuI79iojTA6a1rX/nkqHsQI3aHuUsF+
         vXhHO8dAnH0y2wr/szNVpVdvVADgNopZPnSSx2lv04qPG90mMpjuwvhGvyj2bes1ugbe
         l+8VF6jWaiBrfY0wKLG7uHZGczwkxCHrmRrLstbZ9vtRqqXYXr5uYz/Nfnh//cAacERY
         AsXpPctMccMYIaub+rm8CNBxnexinWN8BsfVUixtuMEewA/aN0T+XrElMwxFIA6QSz9M
         OmOsTZvKBeJZTZ20k+E4qZ7OfbMV+6+4le68RwPXd6XBd4n/nCdDpruHwQt5f9fhutAg
         nVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=lbxm4I5yIjwGE7v8E0Zy1ljgjBqzdD4WSXAeDUOfDHo=;
        b=YbkpYrlnqEWdLwAWA0/uf1kVseBdagiWNc4b1fG9tIYxeMsggQekobjCd7C6qK4UGQ
         XVElEDk5quLNrUPOwuQ9J+cAwdGtzEdThIxbvxGQ7VXgmZ8BnD9mRdU+mskuW3fgDQe1
         Sd5+ThvVz0JwaS4vpKzNhSPJvyeKfX8VqF1z4/FTaPp9+iZNLcbg3DFFMRzwfbpTBeCq
         UWlggk0VUrWUImh88x/4z3iQCBbE9lH27MEbXAxGOmQ3M2TJ12BZ29z5H/WYdSlk/Xz+
         pgyNbT5zC+XxNXezw9t14EIJg8jcLwFzR3f1/xQwU2K6SNc1V8OQNupGx7CMW+uGFzfx
         2X8A==
X-Gm-Message-State: AOAM533YKjexR3Yd95NxDvQnuKm+adEQCOpS8QDO3RNEwVZ4k51Uw/gz
        eeJjcYtYqvnQ3sjQB3WWkHDBCifCgDw2kTIOUWo=
X-Google-Smtp-Source: ABdhPJypfUmCg2xIZd7cO8SPS8EkxO2fgwnrfk8U1QM7cM7H0g/2embQ6oD6sWq1E1W9IWLyNmfmcfSZgP0+SDb+OI4=
X-Received: by 2002:a05:6602:224a:: with SMTP id o10mr19841613ioo.90.1591048743961;
 Mon, 01 Jun 2020 14:59:03 -0700 (PDT)
MIME-Version: 1.0
From:   Norbert Lange <nolange79@gmail.com>
Date:   Mon, 1 Jun 2020 23:58:53 +0200
Message-ID: <CADYdroP0zdz=QtuDFCXpkDohEAgGOc7hDHT8_NnqKuvi979J5Q@mail.gmail.com>
Subject: Re: [GIT PULL][PATCH v5 0/8] Add support for ZSTD-compressed kernel
 and initramfs
To:     nickrterrell@gmail.com, akpm@linux-foundation.org
Cc:     Kernel-team@fb.com, clm@fb.com, gregkh@linuxfoundation.org,
        keescook@chromium.org, kilobyte@angband.pl,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        mingo@kernel.org, oss@malat.biz, patrick@stwcx.xyz,
        patrickw3@fb.com, rmikey@fb.com, sedat.dilek@gmail.com,
        terrelln@fb.com, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The series seems to be stuck in limbo, and I got the hint to bring
this to Andrew's attention [1].
Hope this will finally end in upstream, been using these patches for ~2 years.

Regards, Norbert

[1] - https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=955469
