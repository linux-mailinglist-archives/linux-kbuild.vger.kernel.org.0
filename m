Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7637052507D
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 May 2022 16:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243585AbiELOpM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 12 May 2022 10:45:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232208AbiELOpK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 May 2022 10:45:10 -0400
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94D5B26195A
        for <linux-kbuild@vger.kernel.org>; Thu, 12 May 2022 07:45:08 -0700 (PDT)
Received: by mail-yb1-xb42.google.com with SMTP id v59so10134805ybi.12
        for <linux-kbuild@vger.kernel.org>; Thu, 12 May 2022 07:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to;
        bh=y/WwzOufdV8bFjC2XhKxeIddPBCZMNKZVHLfMOMvj6I=;
        b=Tfg9QhC/6+z1L3A9MYBZOioyqrfbRMMqjJbdplXJGpPz91P33FgrJUjhdK58ycyA+l
         zwjrXwzXQVRC5Y63P9oyX/oyjWzbVTd87GEl3gfXMb0InokGqY7zA4CbXSNBXNmuvgqH
         KFWqHbPJMLbty+cHZMh9iv0J9OkLxmZ155C0xQ6xLPfsmIOxGlfJVxMZ5Lo/meezpLnR
         yn+7oLLmFfvlyFekx5Z7pu4YJmDOljD54o+Kbp0IMYHeJccF/DvOtzdomyWHHqKbHP0l
         lEaLC1AnAt3ovz5qzzWWWOfkjV6laCFNMSEInsJ2yuvawqk5dKvBSEXrnnxlBi+Conix
         QkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to;
        bh=y/WwzOufdV8bFjC2XhKxeIddPBCZMNKZVHLfMOMvj6I=;
        b=unTHSz+t6MCpfT9bBWe4JBfZQxHQpqiNtpnHZEam3OYI653g9waMAQCaALUmYPguwh
         c+KhTFw0OKH43DAjM6SxHykE+9uVF4Xq6mN6ebX9XNL0KZ6TONoaXSSFXh4C2iW+5xhK
         To4o5zF5lvcUrekxkOoo4N87Q7LXZyxKwVfoeWAC7kkyXK7Hf/Aw8SEatv1XcumctPtt
         TIW9NscE9iLTJKjf1TgdvrkVbjeU0wvRP8LSj1gFfIQh0Rpp8lw8mq/sNjmefH9DLBi/
         5mncCsx5GCxN/agCaMAy8CPWNe+vuJDqtyOoFxxU+g3IebB6sxjMuWZGGd2FQyUXw39i
         IPkw==
X-Gm-Message-State: AOAM532k80zYlyZ94zm7CIHyh3BAkmWTc5x6+QSpXdl8EPBCphQ9KHty
        WULlwjSzsuYSeyOGKJk5d1iosKZuXz/TD+N0ORA=
X-Google-Smtp-Source: ABdhPJzc6ExqrDi9/Kpf9TfZ1EIkxmLrPoNdNsTi29YCVswBxwNLstZ+SylWIxwWTs/ZXn4QdZn15LNKTAucFpbMpuU=
X-Received: by 2002:a25:d3cf:0:b0:645:d937:747b with SMTP id
 e198-20020a25d3cf000000b00645d937747bmr102311ybf.383.1652366707792; Thu, 12
 May 2022 07:45:07 -0700 (PDT)
MIME-Version: 1.0
Reply-To: drtracywilliams89@gmail.com
Sender: mrblaisehonore2015@gmail.com
Received: by 2002:a05:7000:9450:0:0:0:0 with HTTP; Thu, 12 May 2022 07:45:07
 -0700 (PDT)
From:   "Dr. Tracy Williams" <tracy0wiliams@gmail.com>
Date:   Thu, 12 May 2022 07:45:07 -0700
X-Google-Sender-Auth: 6ZL3cHYpspYsAzZf9J3ni9L-2h4
Message-ID: <CAFGBUsjkJMC8U1XJ3SdW3ecq6ijScppbq4d1qDjw+vZ3N5iXLw@mail.gmail.com>
Subject: From Dr. Tracy Williams.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b42 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mrblaisehonore2015[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [mrblaisehonore2015[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [drtracywilliams89[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.5 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello Dear,

how are you today,I hope you are doing great. It is my great pleasure
to contact you,I want to make a new and special friend,I hope you
don't mind. My name is Tracy Williams

from the United States, Am a french and English nationality. I will
give you pictures and more details about my self as soon as i hear
from you in my email account bellow,
Here is my email address; drtracywilliams89@gmail.com


Please send your reply to my PRIVATE  mail box.
Thanks,

Tracy Williams.
