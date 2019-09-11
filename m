Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F055AF663
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Sep 2019 09:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbfIKHHR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Sep 2019 03:07:17 -0400
Received: from mail2.protonmail.ch ([185.70.40.22]:48917 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726889AbfIKHHR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Sep 2019 03:07:17 -0400
Date:   Wed, 11 Sep 2019 07:07:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aurabindo.in;
        s=protonmail; t=1568185634;
        bh=o1L+8KhqsX2u25XHVsCqbScSrZDVm6VBVGwx2oUNrkc=;
        h=Date:To:From:Cc:Reply-To:Subject:Feedback-ID:From;
        b=B1ngaLX5Wd0vi0NHSp7skQKh8dYy4lezL9ofvPLKxXliM72y9PJF4LOxBEYH7uFZC
         Z++rLaVCEzu2lnHJ/qIXYW5ltoyhKg1aOg/UTULTuX3epfAqsBxEgfx1+viO2SlrCP
         wUAMOlolarO3wnMNqjqWJ5w30HjId+EtZmFEOyv0=
To:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>
From:   Aurabindo Jayamohanan <mail@aurabindo.in>
Cc:     "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Reply-To: Aurabindo Jayamohanan <mail@aurabindo.in>
Subject: [RFC] buildtar: add case for riscv architecture
Message-ID: <NwVOGH2ZdDQaDK35QUy7y8GS__G8IYSIUUIBAJsimZq5BgvI3SzLS3uY6fV7Pgppq-RTRHzpT-8KrsLjDN74CPWwHTCWoSgHkGbeJNvyS30=@aurabindo.in>
Feedback-ID: D1Wwva8zb0UdpJtanaReRLGO3iCsewpGmDn8ZDKmpao-Gnxd2qXPmwwrSQ99r5Q15lmK-D8x6vKzqhUKCgzweA==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: multipart/mixed;
        boundary="b1_8aa5ac17d5a37d2299526ba3f06c3a3e"
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF autolearn=ham
        autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is a multi-part message in MIME format.

--b1_8aa5ac17d5a37d2299526ba3f06c3a3e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I would like to know if something extra needs to be done other than copying=
 compressed kernel image, when making tar package for riscv architecture. P=
lease see the attached patch.

--

Thanks and Regards,
Aurabindo Jayamohanan

--b1_8aa5ac17d5a37d2299526ba3f06c3a3e
Content-Type: text/x-patch; name="0001-buildtar-add-riscv-case.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=0001-buildtar-add-riscv-case.patch

RnJvbSA4NmZlYjkzYzYyZGFhNjEzMTRkZjBiYmUxYTExMjcyYzIzYjFlYWRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBdXJhYmluZG8gSmF5YW1vaGFuYW4gPG1haWxAYXVyYWJpbmRv
LmluPgpEYXRlOiBUaHUsIDUgU2VwIDIwMTkgMTI6NTI6NDUgKzA1MzAKU3ViamVjdDogW1BBVENI
XSBidWlsZHRhcjogYWRkIHJpc2N2IGNhc2UKCkNvcHkgY29tcHJlc3NlZCBrZXJuZWwgaW1hZ2Ug
aW50byB0YXJiYWxsIHJvb3QuIFNpbWlsYXIKYWN0aW9uIGZvciBib3RoIGFybTY0IGFuZCByaXNj
diBhcmNoaXRlY3R1cmVzLgoKU2lnbmVkLW9mZi1ieTogQXVyYWJpbmRvIEpheWFtb2hhbmFuIDxt
YWlsQGF1cmFiaW5kby5pbj4KLS0tCiBzY3JpcHRzL3BhY2thZ2UvYnVpbGR0YXIgfCA2ICsrKy0t
LQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9zY3JpcHRzL3BhY2thZ2UvYnVpbGR0YXIgYi9zY3JpcHRzL3BhY2thZ2UvYnVpbGR0
YXIKaW5kZXggMmY2NmM4MWU0MDIxLi4zODhkMGZjYmU4YzIgMTAwNzU1Ci0tLSBhL3NjcmlwdHMv
cGFja2FnZS9idWlsZHRhcgorKysgYi9zY3JpcHRzL3BhY2thZ2UvYnVpbGR0YXIKQEAgLTEwNSwx
MCArMTA1LDEwIEBAIGNhc2UgIiR7QVJDSH0iIGluCiAJCQljcCAtdiAtLSAiJHtvYmp0cmVlfS92
bWxpbnV4IiAiJHt0bXBkaXJ9L2Jvb3Qvdm1saW51eC0ke0tFUk5FTFJFTEVBU0V9IgogCQlmaQog
CQk7OwotCWFybTY0KQorCWFybTY0fHJpc2N2KQogCQlmb3IgaSBpbiBJbWFnZS5iejIgSW1hZ2Uu
Z3ogSW1hZ2UubHo0IEltYWdlLmx6bWEgSW1hZ2UubHpvIDsgZG8KLQkJCWlmIFsgLWYgIiR7b2Jq
dHJlZX0vYXJjaC9hcm02NC9ib290LyR7aX0iIF0gOyB0aGVuCi0JCQkJY3AgLXYgLS0gIiR7b2Jq
dHJlZX0vYXJjaC9hcm02NC9ib290LyR7aX0iICIke3RtcGRpcn0vYm9vdC92bWxpbnV6LSR7S0VS
TkVMUkVMRUFTRX0iCisJCQlpZiBbIC1mICIke29ianRyZWV9L2FyY2gvJHtBUkNIfS9ib290LyR7
aX0iIF0gOyB0aGVuCisJCQkJY3AgLXYgLS0gIiR7b2JqdHJlZX0vYXJjaC8ke0FSQ0h9L2Jvb3Qv
JHtpfSIgIiR7dG1wZGlyfS9ib290L3ZtbGludXotJHtLRVJORUxSRUxFQVNFfSIKIAkJCQlicmVh
awogCQkJZmkKIAkJZG9uZQotLSAKMi4yMy4wCgo=


--b1_8aa5ac17d5a37d2299526ba3f06c3a3e--

