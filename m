Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03AC27E2512
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Nov 2023 14:27:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232625AbjKFN2A (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Nov 2023 08:28:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232642AbjKFN17 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Nov 2023 08:27:59 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BAEFD47
        for <linux-kbuild@vger.kernel.org>; Mon,  6 Nov 2023 05:27:56 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C362CC433C7;
        Mon,  6 Nov 2023 13:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1699277275;
        bh=XlBBRzvBN8hAFHFL4hGz0kiOgBqJIwPewUDsolt2uK0=;
        h=Date:From:To:Subject:From;
        b=QPl2KM9sCIEBEIgCbDDCtPRWmh+4Elyg5RmIGZHv6uN6zywQtRDZmPvS6x7kT7R71
         WkPrvDu4IIJJzFz3fyQf8LsiYVbPRwBk8JU/eI6vLoPeWYrGu2OTZBHZWXDl8sQ1Z5
         I3cQuLdKtlONyUrEuw0oGA3x0zQPp6pJLJgLML2s=
Date:   Mon, 6 Nov 2023 08:27:54 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     linux-kbuild@vger.kernel.org
Subject: PSA: migrating linux-kbuild to new vger infrastructure
Message-ID: <20231106-dandelion-grasshopper-of-correction-698afe@nitro>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Good day!

I plan to migrate the linux-kbuild@vger.kernel.org list to the new
infrastructure this week. We're still doing it list-by-list to make sure that
we don't run into scaling issues with the new infra.

The migration will be performed live and should not require any downtime.
There will be no changes to how anyone interacts with the list after
migration is completed, so no action is required on anyone's part.

Please let me know if you have any concerns.

Best wishes,
-K
