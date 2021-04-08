Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0521F358EF3
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Apr 2021 23:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232327AbhDHVF2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Apr 2021 17:05:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232091AbhDHVF2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Apr 2021 17:05:28 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31958C061760;
        Thu,  8 Apr 2021 14:05:16 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id u20so3907645lja.13;
        Thu, 08 Apr 2021 14:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cL1lIDwElKZOdkbB2wZKzZjjfLi2TedoZx0xq0Spyjo=;
        b=bo3BA3XtRoF9Gi8sX90YuyzjPikFix/O1CZPeRpmjy2ip3YOUPpzWgCz+Qtk8rYjVe
         Ie6SI1ofCGYzhV6dvfa/EaqSXK52fZILpU8bBvtr2g/9Cxoi/Ze8Styj376WWmdg31YC
         52bXkjlC++k/iu4QilcNW0rufyBGgKO51m+yH+pfsO2k8XTFTXpVQuW5uIQXZ/EW6O91
         Ah19icEiNY2hn22wtWlFYLIE1r2iCv2ho9VeW2jOpceHqj4zqCMe3iTPSXZy+1N9dxv+
         U5GkosQCkq89u26tgach7WHIsFbvC5R9RvzSqs+FTWssGy8RWaWz0V9npIs0L/fhLsLu
         ENkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cL1lIDwElKZOdkbB2wZKzZjjfLi2TedoZx0xq0Spyjo=;
        b=KmuBw2vaZlgoEFvkkhK0XEUWGmA5hb0axTE4v9YMmQ/tzSUr9Mx1iWvO3EWuNt0XXM
         M3lwTaH5Con+Q9LxjCAK0O4SHRgUJS+Fq4/XuCcVPrPNISmplktytAsMyzGNhtH7j8py
         SweihOgbWqAXN+tn3jz+Kx7GKcc+AL+2NtExK+SvPpMOlpZftrSxXxwZ8aqyiCYctHRR
         14SQ4tgqXrJcAuSAuhL82EVNfgDPqN0iiV+XTVD0/3EJ/lFocI4WtJ/hCNkbAl0X/Xzl
         wpcY82vvOaZS7uIAWTTJHGAg+tx9ZTIDe0/iAvPZTZ2BgwRbtJ2dCjwJiNLtKf8PU+9J
         YfAQ==
X-Gm-Message-State: AOAM532azoodlJgF2usFkE+Uea8kY0WdkSuSd/PhnTDwLZUWgYrZDW1L
        gDpbagcxWMhHUjUY1af2CtOYrnOUX0w/1g==
X-Google-Smtp-Source: ABdhPJz21GlpPbzlJCpXqcohiFju1pN7dGjwIM00xOtcWmWjNucAqrXgdKxFG+IkeTfNrxOIpkK8Nw==
X-Received: by 2002:a2e:809a:: with SMTP id i26mr7328266ljg.357.1617915914774;
        Thu, 08 Apr 2021 14:05:14 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a31a:e13a:eb00:c5cf:27cc:1ef2:859])
        by smtp.gmail.com with ESMTPSA id i81sm23500lfd.58.2021.04.08.14.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 14:05:14 -0700 (PDT)
From:   Piotr Gorski <lucjan.lucjanov@gmail.com>
To:     lucjan.lucjanov@gmail.com
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        masahiroy@kernel.org, oleksandr@natalenko.name,
        sedat.dilek@gmail.com
Subject: Subject: Re: [PATCH v3] kbuild: add support for zstd compressed modules
Date:   Thu,  8 Apr 2021 23:04:47 +0200
Message-Id: <20210408210448.1850553-1-lucjan.lucjanov@gmail.com>
X-Mailer: git-send-email 2.31.0.97.g1424303384
In-Reply-To: <20210407160927.222092-1-lucjan.lucjanov@gmail.com>
References: <20210407160927.222092-1-lucjan.lucjanov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

No, the --rm option is essential. xz and gzip have the --rm option built in as opposed to zstd, which is why I used it. I've been using zstd module compression since last december (although I set a different compression level on mine) and everything works fine. Oleksandr also tested it at his place and didn't report any objections. 
