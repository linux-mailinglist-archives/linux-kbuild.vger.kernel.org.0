Return-Path: <linux-kbuild+bounces-12749-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLAXDG9q2Wn5pQgAu9opvQ
	(envelope-from <linux-kbuild+bounces-12749-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 23:23:59 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 99ABB3DCDE1
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 23:23:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43ADD30062CA
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 21:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E34873D8100;
	Fri, 10 Apr 2026 21:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="SCMzWSjb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw01.zimbra-vnc.de (mailgw01.zimbra-vnc.de [148.251.101.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FE13C9EF3;
	Fri, 10 Apr 2026 21:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.101.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775856227; cv=none; b=eYbuEbAeQsWxqVBkhxewZdgzHGbi8zJIedNoCT7mMxvGvZj885dqi+nehU3vw+dFosgQdvFif6T9gt2KWpfC6KkvHfqXV69SwFkXVv/058iCfPAx/O1cgsEKneul+7iaxcw56IURLZr0hO3Hy0MTs/TmCR+MzQY6FW7+ZvAoJ2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775856227; c=relaxed/simple;
	bh=wCLbKzEvbQp2g2o8c+1S9PeLQYWrtb2VwisHeUgOPcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zmh/ZgyruOayUg+JLLQ8t8YZ9Sbyaw/11FxPCFMXs1gcky49FJnna2xAzRO3oMAVA0sB33z7Akp2l7NH7J8xlTqizrfrVHwmPPS1oVki2ZZphzcgNHsEKonyt8ZCLBu9/JZnQDtJlcPRtSKKiQ4U1jYH9QCjSdewJYAgAF58GDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=SCMzWSjb; arc=none smtp.client-ip=148.251.101.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw01.zimbra-vnc.de (Postfix) with ESMTPS id 0662D3FAF8;
	Fri, 10 Apr 2026 23:23:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id AD5261FADEA;
	Fri, 10 Apr 2026 23:23:39 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 6g4sDe6OHofu; Fri, 10 Apr 2026 23:23:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 931751FA89E;
	Fri, 10 Apr 2026 23:23:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 931751FA89E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1775856218;
	bh=xOM43qfjHIOHiubupTzMcNC7jRk35Lb4N+8/eq17WLM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=SCMzWSjbh4j2k/fFSGIUqeT+yOaHZgU733JC+uS9eo7fQqWsjv1RsGEEyhMULzdwF
	 poRuN90z0/QPs/bwAFGh25DmioOffukQXw6xDs4M0u/FKQ/R31qubiW+0WRzybkcN/
	 eLLOxpWmae3D+E1RUko/xNtzn5mjZvfchAHESAp7hCOdR4GfaD1C4E1OvbcWcjsGSJ
	 lxfT2RwnyjnEagzy93j4/Zl/fW1tKopUGKqgtW/jan5f9IyFlt99hj42rYUKuomiZd
	 zkoggqfdNBC8JwVbU57qUfTRlzPliV5sv9Uer1vIV5z0yzB6z6LOya9eQ1UsFgkm7Y
	 uaaU9lZCU+Ynw==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id ylYlS9zRdnrV; Fri, 10 Apr 2026 23:23:38 +0200 (CEST)
Received: from luis-Precision-5480.. (ipservice-092-209-239-167.092.209.pools.vodafone-ip.de [92.209.239.167])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 3A0C61F89B3;
	Fri, 10 Apr 2026 23:23:38 +0200 (CEST)
From: Luis <luis.augenstein@tngtech.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	kstewart@linuxfoundation.org,
	maximilian.huber@tngtech.com,
	Luis Augenstein <luis.augenstein@tngtech.com>
Subject: [PATCH v5 07/15] scripts/sbom: add SPDX classes
Date: Fri, 10 Apr 2026 23:22:47 +0200
Message-ID: <20260410212255.9883-8-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410212255.9883-1-luis.augenstein@tngtech.com>
References: <20260410212255.9883-1-luis.augenstein@tngtech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[tngtech.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[tngtech.com:s=B14491C6-869D-11EB-BB6C-8DD33D883B31];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12749-lists,linux-kbuild=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,tngtech.com:dkim,tngtech.com:email,tngtech.com:mid,spdx.github.io:url];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[luis.augenstein@tngtech.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[tngtech.com:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 99ABB3DCDE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Luis Augenstein <luis.augenstein@tngtech.com>

Implement Python dataclasses to model the SPDX classes
required within an SPDX document. The class and property
names are consistent with the SPDX 3.0.1 specification.

Assisted-by: Cursor:claude-sonnet-4-5
Assisted-by: OpenCode:GLM-4-7
Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 scripts/sbom/sbom/spdx/__init__.py        |   7 +
 scripts/sbom/sbom/spdx/build.py           |  17 +++
 scripts/sbom/sbom/spdx/core.py            | 170 ++++++++++++++++++++++
 scripts/sbom/sbom/spdx/serialization.py   |  56 +++++++
 scripts/sbom/sbom/spdx/simplelicensing.py |  20 +++
 scripts/sbom/sbom/spdx/software.py        |  69 +++++++++
 scripts/sbom/sbom/spdx/spdxId.py          |  36 +++++
 7 files changed, 375 insertions(+)
 create mode 100644 scripts/sbom/sbom/spdx/__init__.py
 create mode 100644 scripts/sbom/sbom/spdx/build.py
 create mode 100644 scripts/sbom/sbom/spdx/core.py
 create mode 100644 scripts/sbom/sbom/spdx/serialization.py
 create mode 100644 scripts/sbom/sbom/spdx/simplelicensing.py
 create mode 100644 scripts/sbom/sbom/spdx/software.py
 create mode 100644 scripts/sbom/sbom/spdx/spdxId.py

diff --git a/scripts/sbom/sbom/spdx/__init__.py b/scripts/sbom/sbom/spdx/=
__init__.py
new file mode 100644
index 00000000000..4097b59f8f1
--- /dev/null
+++ b/scripts/sbom/sbom/spdx/__init__.py
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+from .spdxId import SpdxId, SpdxIdGenerator
+from .serialization import JsonLdSpdxDocument
+
+__all__ =3D ["JsonLdSpdxDocument", "SpdxId", "SpdxIdGenerator"]
diff --git a/scripts/sbom/sbom/spdx/build.py b/scripts/sbom/sbom/spdx/bui=
ld.py
new file mode 100644
index 00000000000..180a8f1e8bd
--- /dev/null
+++ b/scripts/sbom/sbom/spdx/build.py
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+from dataclasses import dataclass, field
+from sbom.spdx.core import DictionaryEntry, Element, Hash
+
+
+@dataclass(kw_only=3DTrue)
+class Build(Element):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Build/Classes/Build=
/"""
+
+    type: str =3D field(init=3DFalse, default=3D"build_Build")
+    build_buildType: str
+    build_buildId: str
+    build_environment: list[DictionaryEntry] =3D field(default_factory=3D=
list[DictionaryEntry])
+    build_configSourceUri: list[str] =3D field(default_factory=3Dlist[st=
r])
+    build_configSourceDigest: list[Hash] =3D field(default_factory=3Dlis=
t[Hash])
diff --git a/scripts/sbom/sbom/spdx/core.py b/scripts/sbom/sbom/spdx/core=
.py
new file mode 100644
index 00000000000..74613e4bdd2
--- /dev/null
+++ b/scripts/sbom/sbom/spdx/core.py
@@ -0,0 +1,170 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+from dataclasses import dataclass, field
+from datetime import datetime, timezone
+from typing import Any, Literal
+from sbom.spdx.spdxId import SpdxId
+
+SPDX_SPEC_VERSION =3D "3.0.1"
+
+ExternalIdentifierType =3D Literal["email", "gitoid", "urlScheme"]
+HashAlgorithm =3D Literal["sha256", "sha512"]
+ProfileIdentifierType =3D Literal["core", "software", "build", "lite", "=
simpleLicensing"]
+RelationshipType =3D Literal[
+    "contains",
+    "generates",
+    "hasDeclaredLicense",
+    "hasInput",
+    "hasOutput",
+    "ancestorOf",
+    "hasDistributionArtifact",
+    "dependsOn",
+]
+RelationshipCompleteness =3D Literal["complete", "incomplete", "noAssert=
ion"]
+
+
+@dataclass
+class SpdxObject:
+    def to_dict(self) -> dict[str, Any]:
+        def _to_dict(v: Any):
+            return v.to_dict() if hasattr(v, "to_dict") else v
+
+        d: dict[str, Any] =3D {}
+        for field_name in self.__dataclass_fields__:
+            value =3D getattr(self, field_name)
+            if not value:
+                continue
+
+            if isinstance(value, Element):
+                d[field_name] =3D value.spdxId
+            elif isinstance(value, list) and len(value) > 0 and isinstan=
ce(value[0], Element):  # type: ignore
+                value: list[Element] =3D value
+                d[field_name] =3D [v.spdxId for v in value]
+            else:
+                d[field_name] =3D [_to_dict(v) for v in value] if isinst=
ance(value, list) else _to_dict(value)  # type: ignore
+        return d
+
+
+@dataclass(kw_only=3DTrue)
+class IntegrityMethod(SpdxObject):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Integr=
ityMethod/"""
+
+
+@dataclass(kw_only=3DTrue)
+class Hash(IntegrityMethod):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Hash/"=
""
+
+    type: str =3D field(init=3DFalse, default=3D"Hash")
+    hashValue: str
+    algorithm: HashAlgorithm
+
+
+@dataclass(kw_only=3DTrue)
+class Element(SpdxObject):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Elemen=
t/"""
+
+    type: str =3D field(init=3DFalse, default=3D"Element")
+    spdxId: SpdxId
+    creationInfo: str =3D "_:creationinfo"
+    name: str | None =3D None
+    verifiedUsing: list[Hash] =3D field(default_factory=3Dlist[Hash])
+    comment: str | None =3D None
+
+
+@dataclass(kw_only=3DTrue)
+class ExternalMap(SpdxObject):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Extern=
alMap/"""
+
+    type: str =3D field(init=3DFalse, default=3D"ExternalMap")
+    externalSpdxId: SpdxId
+
+
+@dataclass(kw_only=3DTrue)
+class NamespaceMap(SpdxObject):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Namesp=
aceMap/"""
+
+    type: str =3D field(init=3DFalse, default=3D"NamespaceMap")
+    prefix: str
+    namespace: str
+
+
+@dataclass(kw_only=3DTrue)
+class ElementCollection(Element):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Elemen=
tCollection/"""
+
+    type: str =3D field(init=3DFalse, default=3D"ElementCollection")
+    element: list[Element] =3D field(default_factory=3Dlist[Element])
+    rootElement: list[Element] =3D field(default_factory=3Dlist[Element]=
)
+    profileConformance: list[ProfileIdentifierType] =3D field(default_fa=
ctory=3Dlist[ProfileIdentifierType])
+
+
+@dataclass(kw_only=3DTrue)
+class SpdxDocument(ElementCollection):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/SpdxDo=
cument/"""
+
+    type: str =3D field(init=3DFalse, default=3D"SpdxDocument")
+    import_: list[ExternalMap] =3D field(default_factory=3Dlist[External=
Map])
+    namespaceMap: list[NamespaceMap] =3D field(default_factory=3Dlist[Na=
mespaceMap])
+
+    def to_dict(self) -> dict[str, Any]:
+        return {("import" if k =3D=3D "import_" else k): v for k, v in s=
uper().to_dict().items()}
+
+
+@dataclass(kw_only=3DTrue)
+class Agent(Element):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Agent/=
"""
+
+    type: str =3D field(init=3DFalse, default=3D"Agent")
+
+
+@dataclass(kw_only=3DTrue)
+class SoftwareAgent(Agent):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Softwa=
reAgent/"""
+
+    type: str =3D field(init=3DFalse, default=3D"SoftwareAgent")
+
+
+@dataclass(kw_only=3DTrue)
+class CreationInfo(SpdxObject):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Creati=
onInfo/"""
+
+    type: str =3D field(init=3DFalse, default=3D"CreationInfo")
+    id: SpdxId =3D "_:creationinfo"
+    specVersion: str =3D SPDX_SPEC_VERSION
+    createdBy: list[Agent]
+    created: str =3D field(default_factory=3Dlambda: datetime.now(timezo=
ne.utc).strftime("%Y-%m-%dT%H:%M:%SZ"))
+    comment: str | None =3D None
+
+    def to_dict(self) -> dict[str, Any]:
+        return {("@id" if k =3D=3D "id" else k): v for k, v in super().t=
o_dict().items()}
+
+
+@dataclass(kw_only=3DTrue)
+class Relationship(Element):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Relati=
onship/"""
+
+    type: str =3D field(init=3DFalse, default=3D"Relationship")
+    relationshipType: RelationshipType
+    from_: Element  # underscore because 'from' is a reserved keyword
+    to: list[Element]
+    completeness: RelationshipCompleteness | None =3D None
+
+    def to_dict(self) -> dict[str, Any]:
+        return {("from" if k =3D=3D "from_" else k): v for k, v in super=
().to_dict().items()}
+
+
+@dataclass(kw_only=3DTrue)
+class Artifact(Element):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Artifa=
ct/"""
+
+    type: str =3D field(init=3DFalse, default=3D"Artifact")
+
+
+@dataclass(kw_only=3DTrue)
+class DictionaryEntry(SpdxObject):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Dictio=
naryEntry/"""
+
+    type: str =3D field(init=3DFalse, default=3D"DictionaryEntry")
+    key: str
+    value: str
diff --git a/scripts/sbom/sbom/spdx/serialization.py b/scripts/sbom/sbom/=
spdx/serialization.py
new file mode 100644
index 00000000000..c830d6b3cf1
--- /dev/null
+++ b/scripts/sbom/sbom/spdx/serialization.py
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+import json
+from typing import Any
+from sbom.path_utils import PathStr
+from sbom.spdx.core import SPDX_SPEC_VERSION, SpdxDocument, SpdxObject
+
+
+class JsonLdSpdxDocument:
+    """Represents an SPDX document in JSON-LD format for serialization."=
""
+
+    context: list[str | dict[str, str]]
+    graph: list[SpdxObject]
+
+    def __init__(self, graph: list[SpdxObject]) -> None:
+        """
+        Initialize a JSON-LD SPDX document from a graph of SPDX objects.
+        The graph must contain a single SpdxDocument element.
+
+        Args:
+            graph: List of SPDX objects representing the complete SPDX d=
ocument.
+        """
+        self.graph =3D graph
+        spdx_document =3D next(element for element in graph if isinstanc=
e(element, SpdxDocument))
+        self.context =3D [
+            f"https://spdx.org/rdf/{SPDX_SPEC_VERSION}/spdx-context.json=
ld",
+            {namespaceMap.prefix: namespaceMap.namespace for namespaceMa=
p in spdx_document.namespaceMap},
+        ]
+        spdx_document.namespaceMap =3D []
+
+    def to_dict(self) -> dict[str, Any]:
+        """
+        Convert the SPDX document to a dictionary representation suitabl=
e for JSON serialization.
+
+        Returns:
+            Dictionary with @context and @graph keys following JSON-LD f=
ormat.
+        """
+        return {
+            "@context": self.context,
+            "@graph": [item.to_dict() for item in self.graph],
+        }
+
+    def save(self, path: PathStr, prettify: bool) -> None:
+        """
+        Save the SPDX document to a JSON file.
+
+        Args:
+            path: File path where the document will be saved.
+            prettify: Whether to pretty-print the JSON with indentation.
+        """
+        with open(path, "w", encoding=3D"utf-8") as f:
+            if prettify:
+                json.dump(self.to_dict(), f, indent=3D2)
+            else:
+                json.dump(self.to_dict(), f, separators=3D(",", ":"))
diff --git a/scripts/sbom/sbom/spdx/simplelicensing.py b/scripts/sbom/sbo=
m/spdx/simplelicensing.py
new file mode 100644
index 00000000000..750ddd24ad8
--- /dev/null
+++ b/scripts/sbom/sbom/spdx/simplelicensing.py
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+from dataclasses import dataclass, field
+from sbom.spdx.core import Element
+
+
+@dataclass(kw_only=3DTrue)
+class AnyLicenseInfo(Element):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/SimpleLicensing/Cla=
sses/AnyLicenseInfo/"""
+
+    type: str =3D field(init=3DFalse, default=3D"simplelicensing_AnyLice=
nseInfo")
+
+
+@dataclass(kw_only=3DTrue)
+class LicenseExpression(AnyLicenseInfo):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/SimpleLicensing/Cla=
sses/LicenseExpression/"""
+
+    type: str =3D field(init=3DFalse, default=3D"simplelicensing_License=
Expression")
+    simplelicensing_licenseExpression: str
diff --git a/scripts/sbom/sbom/spdx/software.py b/scripts/sbom/sbom/spdx/=
software.py
new file mode 100644
index 00000000000..3e3389d75cd
--- /dev/null
+++ b/scripts/sbom/sbom/spdx/software.py
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+from dataclasses import dataclass, field
+from typing import Literal
+from sbom.spdx.core import Artifact, ElementCollection, IntegrityMethod
+
+
+SbomType =3D Literal["source", "build"]
+FileKindType =3D Literal["file", "directory"]
+SoftwarePurpose =3D Literal[
+    "source",
+    "archive",
+    "library",
+    "file",
+    "data",
+    "configuration",
+    "executable",
+    "module",
+    "application",
+    "documentation",
+    "other",
+]
+ContentIdentifierType =3D Literal["gitoid", "swhid"]
+
+
+@dataclass(kw_only=3DTrue)
+class Sbom(ElementCollection):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Software/Classes/Sb=
om/"""
+
+    type: str =3D field(init=3DFalse, default=3D"software_Sbom")
+    software_sbomType: list[SbomType] =3D field(default_factory=3Dlist[S=
bomType])
+
+
+@dataclass(kw_only=3DTrue)
+class ContentIdentifier(IntegrityMethod):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Software/Classes/Co=
ntentIdentifier/"""
+
+    type: str =3D field(init=3DFalse, default=3D"software_ContentIdentif=
ier")
+    software_contentIdentifierType: ContentIdentifierType
+    software_contentIdentifierValue: str
+
+
+@dataclass(kw_only=3DTrue)
+class SoftwareArtifact(Artifact):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Software/Classes/So=
ftwareArtifact/"""
+
+    type: str =3D field(init=3DFalse, default=3D"software_Artifact")
+    software_primaryPurpose: SoftwarePurpose | None =3D None
+    software_copyrightText: str | None =3D None
+    software_contentIdentifier: list[ContentIdentifier] =3D field(defaul=
t_factory=3Dlist[ContentIdentifier])
+
+
+@dataclass(kw_only=3DTrue)
+class Package(SoftwareArtifact):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Software/Classes/Pa=
ckage/"""
+
+    type: str =3D field(init=3DFalse, default=3D"software_Package")
+    name: str  # type: ignore
+    software_packageVersion: str | None =3D None
+
+
+@dataclass(kw_only=3DTrue)
+class File(SoftwareArtifact):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Software/Classes/Fi=
le/"""
+
+    type: str =3D field(init=3DFalse, default=3D"software_File")
+    name: str  # type: ignore
+    software_fileKind: FileKindType | None =3D None
diff --git a/scripts/sbom/sbom/spdx/spdxId.py b/scripts/sbom/sbom/spdx/sp=
dxId.py
new file mode 100644
index 00000000000..589e85c5f70
--- /dev/null
+++ b/scripts/sbom/sbom/spdx/spdxId.py
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+from itertools import count
+from typing import Iterator
+
+SpdxId =3D str
+
+
+class SpdxIdGenerator:
+    _namespace: str
+    _prefix: str | None =3D None
+    _counter: Iterator[int]
+
+    def __init__(self, namespace: str, prefix: str | None =3D None) -> N=
one:
+        """
+        Initialize the SPDX ID generator with a namespace.
+
+        Args:
+            namespace: The full namespace to use for generated IDs.
+            prefix: Optional. If provided, generated IDs will use this p=
refix instead of the full namespace.
+        """
+        self._namespace =3D namespace
+        self._prefix =3D prefix
+        self._counter =3D count(0)
+
+    def generate(self) -> SpdxId:
+        return f"{f'{self._prefix}:' if self._prefix else self._namespac=
e}{next(self._counter)}"
+
+    @property
+    def prefix(self) -> str | None:
+        return self._prefix
+
+    @property
+    def namespace(self) -> str:
+        return self._namespace
--=20
2.43.0


