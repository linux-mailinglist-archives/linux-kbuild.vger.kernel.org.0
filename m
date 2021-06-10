Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD2B3A2AF7
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Jun 2021 14:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230329AbhFJMER (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Jun 2021 08:04:17 -0400
Received: from mail-wm1-f50.google.com ([209.85.128.50]:45999 "EHLO
        mail-wm1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230321AbhFJMEP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Jun 2021 08:04:15 -0400
Received: by mail-wm1-f50.google.com with SMTP id v206-20020a1cded70000b02901a586d3fa23so6246437wmg.4
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Jun 2021 05:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
        b=HGPdHk4mZSeEdU0YSuVZAmvv5qY+MKxW2KeAVjQmoNyO4er9EGPiRgCd+R3lFZbtpb
         HtfIRR0CGaYh5flHrMeZi0wVcTFTxKaKkN17SHHSESTciIjaefYEmj92kAiLXPAcXwjG
         knLFjWAFbHi+lIedi+0O+cVleY0f4FJpK3cGKZJUsozaR4cpJk/6ELSUGSV/TNjK6z/S
         yET+xmRB8HlJI+S8aEi5Wl+H6bCOomCj2j7q2Vv7zpr4QnmjBIYYmfi0YBajbENlD2QW
         SBdGNtjJt3lGC5v4pYO3XWRaG4zX4t9O1mZYwEhqvQ29m0its+fkfraRIkqL5q8jcZ/k
         XHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
        b=AQRPUuKhXbqhWPYOiDVG33TtInk3MN4okGKwuIK79icEb2gC6iNZ3/0M8kGq3eUKFl
         agO6N1hmBLzT2Bk46YWrHCOf7GgOCdwO6j05gIB6545kaEZLR8Fb35QqQAhwkRkoMq3W
         IkdofngTUg5tkr5K6bEBezJyJ4R/mjto2qWjAkth9K19FkgBz/GnbeGWBpDyQbqOaS6B
         I2cXGBtDiZ/iS6uJtK4GicVGB3jrtcze2q6muQ5M0Fb1b2oRPAJnqk+wv+tUJrq+GDUW
         V9ycp0AZTa4Z8ByhBZlnWjC2UpPXfMSKeqAH02pPrUCyaAP9ASkcuk66T3oNhD2HvIMZ
         aRjw==
X-Gm-Message-State: AOAM533X6vBkIMb5GSRiXafDJvv/E+jPWrkK11pjhUtSSkVaOQA2MUt9
        kfhCn6v9MdA7SMiGWF0jkhHlu/O7D5q+nSHN
X-Google-Smtp-Source: ABdhPJyXczhLWGQSfHQ/zIbZunBwjV2NSa5Nj1xT3U74o33yJwIIynDCkDyfBrZdH2O8JkdxvmPXfQ==
X-Received: by 2002:a05:600c:1d1a:: with SMTP id l26mr4735017wms.189.1623326466069;
        Thu, 10 Jun 2021 05:01:06 -0700 (PDT)
Received: from [131.254.14.127] (kekleon.irisa.fr. [131.254.14.127])
        by smtp.gmail.com with ESMTPSA id p23sm1406142wmi.26.2021.06.10.05.01.04
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jun 2021 05:01:04 -0700 (PDT)
To:     linux-kbuild@vger.kernel.org
From:   RANDRIANAINA Georges Aaron <randrianaina.georgesaaron@gmail.com>
Message-ID: <a6efb4ad-66bd-fccf-6b42-a40021f603e6@gmail.com>
Date:   Thu, 10 Jun 2021 13:56:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

subscribe

