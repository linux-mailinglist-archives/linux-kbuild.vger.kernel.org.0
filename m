Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 880275A95CB
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Sep 2022 13:34:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232585AbiIALey (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 1 Sep 2022 07:34:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232517AbiIALew (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Sep 2022 07:34:52 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32C55A1A8
        for <linux-kbuild@vger.kernel.org>; Thu,  1 Sep 2022 04:34:47 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-11ba6e79dd1so30767070fac.12
        for <linux-kbuild@vger.kernel.org>; Thu, 01 Sep 2022 04:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version:from
         :to:cc:subject:date;
        bh=/UVrmSBO/Ah16d2MZfS04mIdJZMZC82FdnBLfIfZvYY=;
        b=jj7815zO9lIrzT1xb3HIkq1rZiOLXSVJex1x7gmnusVNsZSNvYlk2k9U6ncZvuxVW+
         AxBLuAhfly0U0T+tlFuMci6XybSZSZ1GrZ6CuZWo0dQL0N9iAVctbt7CQZTBqvjk8gdY
         JWxOMn9+yg6hD4tHWkgy5SsMeTWZK2TtadXpU1oQBskfrSoLUaOnl/zOCCQgEPXRthLG
         JYy7jS+nySgtKF4W5f7wr0EjdCI39iINev9h4i0l76ltvoUYb/kpIfdYzXrCD6Ec6Uog
         jHm4/a20D+yL1Fy4FZLoIAHHqUPyhkF6fXp6InRGLjcr3CEYOAWfdkO1dCd2C6ZoUjVT
         wsRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=/UVrmSBO/Ah16d2MZfS04mIdJZMZC82FdnBLfIfZvYY=;
        b=Ws5dvb15LYDYBii814r+7gKn6+jAHoRMwfntdkpdFnFdVHioMnS9djC/xbJrwUeZdX
         z4O5HWBcNO4aX+wmfAOCt3Zp8shIqCKvNX5DLMVrVS1sECmcTDqUoxSVFlQtSTxp84rU
         PqIlXjIPgiVlv+upco5kh04O8ArKaFHfVV4BCWed5VPK10wbDp4r2AuVhSHJuFpiMAbp
         +UiLyPlPIJPMp2GfVVfv/irT2a2KdvvL51UXMkuBvfBJ/x7aIz7S3CtssXIgs+CVhQlu
         0v2BpCvU8O/WHJubtyK3RWFujGZZAl5NyGzlaIV2TqkfjibijyxpXvpAFpoHNSYcFH/F
         Ho/w==
X-Gm-Message-State: ACgBeo0xZLX561y1C0F//ChTthx1HvBonAXTUodEX/Frrn0Sxz7Ww7hK
        zEGSi/1ofl5AyePN5qB/0SjIO9WDe5ED2QNP3Uk=
X-Google-Smtp-Source: AA6agR6Z/6tFwieJX0h6QjNAUtfKpy7BDsJKKRKBZ6mFOnOzRWz4YRwVxU+0hevZPxm0jrqXPm+uxgONVQg6q4Lfukk=
X-Received: by 2002:aca:5b0b:0:b0:344:bea0:8c88 with SMTP id
 p11-20020aca5b0b000000b00344bea08c88mr3178466oib.225.1662032087000; Thu, 01
 Sep 2022 04:34:47 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sgtkalamanthey@gmail.com
Sender: jaloudagojmail.com@gmail.com
Received: by 2002:a05:6358:2628:b0:b2:2ce0:bf47 with HTTP; Thu, 1 Sep 2022
 04:34:46 -0700 (PDT)
From:   kala manthey <sgtkalamanthey@gmail.com>
Date:   Thu, 1 Sep 2022 04:34:46 -0700
X-Google-Sender-Auth: C0ZdzGUnSqBgJnwsHhcLgZl9KME
Message-ID: <CAJO6yiwss_kkgBS1GB9hDRVp9TF0-DPvta6PXqukM2TjMnQt6A@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

hallo, heb je mijn e-mails ontvangen? controleer en antwoord mij a.u.b.
