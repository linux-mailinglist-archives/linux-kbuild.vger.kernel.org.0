Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDB0CBE8BF
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Sep 2019 01:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726114AbfIYXFH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Sep 2019 19:05:07 -0400
Received: from mail-io1-f43.google.com ([209.85.166.43]:45112 "EHLO
        mail-io1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730974AbfIYXFG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Sep 2019 19:05:06 -0400
Received: by mail-io1-f43.google.com with SMTP id c25so1247226iot.12
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2019 16:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=579Tnc2tHWRxfBzI2AYOcygJW1YrE5JUA2yogVfQLuk=;
        b=ApdS52HZvPG4UPM6xBSrQ2S/UNXlmI8kFOmZudEilOG4y80P5HJRHlUnXKPfNJ+WKH
         au6AjE0kdrTM+IBnFeBGhuDDtnofOCiBS7i2bfyRqXibn7ujiFixczgXhQZkG/9SPJLP
         nWtV3tk8SZJqPR2uvC9inxGGtNfRDe6urfDEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=579Tnc2tHWRxfBzI2AYOcygJW1YrE5JUA2yogVfQLuk=;
        b=XG5Nv+yqRDjO9ay3NijmB7sz0qShgeEXjQrLGCH68SyEyiM4c7sskGfcogpZz0tELE
         peFpiAh4wVfo9coWMDVrrrWc5WB8maAivLqNdUXlcz3Xkz1UlqcTvBL2uJvFnkzcuIZI
         +jszO/mU22N2Qum2V0v3klU2Ex6ZXiGI7NIUu6XXPyv5frdU/I6D9H4RuE+WGsFw9CLi
         AVSr7Eox+OzfKRrtXEKg7OkJzwheuzc0xampwV85CL61jY98BqM1brp7s1o96fLpkv+3
         wMYesDOvHghVcABQS3lf/FEpd/4uwDucbupF3J7dIgDBWBqFnYcGaaljZgJen1F41IhT
         agKg==
X-Gm-Message-State: APjAAAXgc9DzI26hbQdu7ANYxyjsdFGVr8Muh74KvcXLk5n/bSXtg8sz
        Wz+sRndGQ5PlB/USGhK6Pb5jge1hn6s=
X-Google-Smtp-Source: APXvYqw3G8DNm3m995j68ySkBp40wb8S0xhIePya4oAlregS01zaifCXpCYtrJLA2UrcL7HqzDB3rg==
X-Received: by 2002:a02:a792:: with SMTP id e18mr803374jaj.125.1569452705565;
        Wed, 25 Sep 2019 16:05:05 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id f23sm70767ioc.36.2019.09.25.16.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2019 16:05:04 -0700 (PDT)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        shuah@kernel.org
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Simplify kselftest build and install use-cases
Date:   Wed, 25 Sep 2019 17:04:33 -0600
Message-Id: <cover.1569452305.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This patch series simplifies kselftest use-cases and addresses requests
from developers and testers to add support for building and installing
from the main Makefile.

Shuah Khan (2):
  Makefile: Add kselftest_build target to build tests
  selftests: Add kselftest_install target to main Makefile

 Makefile                                     | 8 ++++++++
 tools/testing/selftests/Makefile             | 8 ++++++--
 tools/testing/selftests/kselftest_install.sh | 4 ++--
 3 files changed, 16 insertions(+), 4 deletions(-)

-- 
2.20.1

