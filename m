Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94E8A245B19
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Aug 2020 05:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbgHQDiL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 16 Aug 2020 23:38:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbgHQDiH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 16 Aug 2020 23:38:07 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16728C061388;
        Sun, 16 Aug 2020 20:38:07 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id qc22so16061591ejb.4;
        Sun, 16 Aug 2020 20:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:date:from:to:cc:message-id:in-reply-to:references;
        bh=XH95lzsmh5qjJ/9TkXh/TkWlYJ+83J94AclDffHnhYs=;
        b=KUUiKEig4ldR6C7pBjQiaelmuSgzFZraRby0swDG3g10uqVAYVRzEuM6f2NJ3ph3lZ
         bqBfKz35vk5XUHPMCuRZz/Z47SZ0XCwCXPN/zTxqbfJ+COIs4OdcnTbl1aNNkrWZPvKJ
         nc8sHGllE7/lQVQ1re+3n+qe7lNTqEDC8WC6kczk5/azIs5fmpQLFj3MD+GDhtHcp7Ii
         BorMISizdjEnsNtqIViZfpWZYoOD0Qw2UFCqEaI1aKy/Lqf9PcjcDMWSgcJ8sg5HhLrx
         lxT3lfBRtK1kO+koGBeXpFnLUqdsRWYCzzFNtWkdAryVJV+CqR91D1JdX1F9cdiD5WvJ
         T5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:date:from:to:cc:message-id:in-reply-to
         :references;
        bh=XH95lzsmh5qjJ/9TkXh/TkWlYJ+83J94AclDffHnhYs=;
        b=OnBX7awLyxviOmTHk/NpSpjeEJSG3pytTsJbeKro0gNzLoAL7nysTCfcd+7iUpZZ7p
         cSJG2z/lImHIt0Luv1Yl8rUYyV7ITqjDfHDHSR8MI7Y4fBIBugyGY9uhbhc/J+MdzA8F
         51GzJkoYo5YmGz2r5C8/VfRI4vaadikkrab1u+IV5uXtWkcALTQHomcbN3zz5UOTH9tk
         ATUdCJRD0TXeRh863FhM1LYHVyb6EHSWkxhgsHu7CObGacM240bgU8DkAQZAUNIg3yvw
         KcrxQQLUaEGaKXXcFW4jXcbKaHqvl2u7z0PVjfJTPa463O5Idmf0hxqh1MiIFGFTeynN
         vnQQ==
X-Gm-Message-State: AOAM533m/qX/0Y9wb/QgVaT2coRJNQBjX2tggafo5ZqjN2QqTk/xZEAX
        jDbFXUNlspHwb4TtcUmmcZx/ybvq+buJhJRW
X-Google-Smtp-Source: ABdhPJxeXfZ6pf7xM8wwGZeTcsBpPmR/PcO2rTrWptm+B6ZvC1/pijnAeIRqf0GQ4KAcYV5tQF/XaA==
X-Received: by 2002:a17:906:ca4d:: with SMTP id jx13mr13004782ejb.548.1597635485808;
        Sun, 16 Aug 2020 20:38:05 -0700 (PDT)
Received: from gmail.com (ns31066279.ip-51-77-135.eu. [51.77.135.89])
        by smtp.gmail.com with ESMTPSA id o15sm12520647edr.67.2020.08.16.20.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2020 20:38:05 -0700 (PDT)
Subject: Re: [PATCH] Makefile: Yes. Finally remove '-Wdeclaration-after-statement'
Date:   Mon, 17 Aug 2020 03:37:00 -0000
From:   Michael Witten <mfwitten@gmail.com>
To:     Joe Perches <joe@perches.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Message-ID: <23e2e6c2d3a24954bccb67a3186019b9@gmail.com>
In-Reply-To: <61f8da080e5fac1bc23cdd68c43f199029c0a788.camel@perches.com>
References: <c6fda26e8d134264b04fadc3386d6c32@gmail.com>
  <61f8da080e5fac1bc23cdd68c43f199029c0a788.camel@perches.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Joe Perches (Sun, 16 Aug 2020 10:56:53 -0700):

> I rather prefer block declarations instead of
> sprinkling declarations around with code.

Hey, we all have our guilty pleasures.

Fortunately, even with this patch, you'd still be able to indulge
in your preferred style, or even enforce it among contributors to
the code that you maintain.

However, the following statement should hold:

  If merged code is correct (portable, safe, etc.),
  then the kernel must build without any warning
  about that merged code.

Sometimes, code is clearest (or indeed safest) when it is written
with a variable definition that occurs at a point well within the
body of statements. Authors need to have the option to write such
code; otherwise, style ceases to be means of clarity, and instead
becomes a laborious end unto itself.

Matters of  style should  probably not be  enforced by  the build
infrastructure; style is a matter for the maintainer to enforce:

  * Perhaps there could be a  new build-time switch. By default, 
    the warning can be off for  a normal build; a maintainer can 
    flip the  switch to  turn it on  locally, and  thereby check 
    whether a patch declares  variables unnecessarily hither and 
    thither, as determined by the maintainer's taste.            

  * Perhaps  `scripts/checkpatch.pl' could  be taught  about this
    issue.  Though probably  easier  said than  done, the  script
    could parse every modified block, and warn about declarations
    after  statements (but  maybe  ignore  the declarations  that
    introduce const variables).

  * Perhaps there is already linting infrastructure that could be
    put to such use.

This way, good code can compile cleanly, and style can just be an
ongoing topic of discussion among contributors.

Sincerely,
Michael Witten
